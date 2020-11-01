"
Хранилище с репликацией

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	mutex:		<Object>
	onlyWrite:		<Object>
	readAndWrite:		<Object>


    Implementation Points
"
Class {
	#name : #EIStorage3,
	#superclass : #AbstractStorage,
	#classInstVars : [
		'onlyWrite',
		'readAndWrite'
	],
	#category : #'ExtraImage-Storage'
}

{ #category : #loading }
EIStorage3 class >> commonConfigFullName [
	"Полный путь общей конфигурации"
	| fullName |
	fullName := self config localConfigFullName.
	[ 
				fullName asFileReference exists
						ifFalse: [ FileDoesNotExistException signal ].
				^ fullName asFileReference readStream contents.
	] on: FileDoesNotExistException do: [ :ex2|
			self createLocalConfigDirectory.
			self createLocalConfigFile.
			ex2 resume ].
]

{ #category : #loading }
EIStorage3 class >> createCommonConfigDirectory [
	"создается директория общей конфигурации"
	| fullName dirRef |
	fullName := self commonConfigFullName.
	dirRef := fullName asFileReference fullPath parent asFileReference.
	dirRef exists ifFalse: [ dirRef createDirectory ]
]

{ #category : #loading }
EIStorage3 class >> createCommonConfigFile [
	"создается файл общей конфигурации"
	| fullName wStream |
	fullName := self commonConfigFullName.
	wStream := fullName asFileReference writeStream.
	wStream nextPutAll: '["';
				nextPutAll: self config localStorage;
				nextPutAll: '"]'.
	wStream close.
]

{ #category : #loading }
EIStorage3 class >> createLocalConfigDirectory [
	"создается директория расположения локальной конфигурации"
	| dir |
	dir := self config localConfigPath asFileReference.
	dir exists ifFalse: [ dir createDirectory ]
]

{ #category : #loading }
EIStorage3 class >> createLocalConfigFile [
	"создается локальный конфигурационный файл"
	| fileRef wStream |
	fileRef := self config localConfigFullName asFileReference.
	wStream := fileRef writeStream.
	wStream nextPutAll: self config localConfigPath;
			nextPutAll: self config delimiter;
			nextPutAll: self config commonConfigFile.
	wStream close.
]

{ #category : #loading }
EIStorage3 class >> createStorageDirectories [
	self readAndWrite do: [ :dirPath|
		dirPath asFileReference exists
			ifFalse: [ dirPath asFileReference createDirectory ] ]
	
]

{ #category : #'class initialization' }
EIStorage3 class >> initialize [
	self loadCommonConfig.
]

{ #category : #loading }
EIStorage3 class >> loadCommonConfig [
	"загрузка конфигурации, фактически загружаются пути расположения хранилищ,
	если файлов нет они создаются по умолчанию"
	| commonConfigFullName jsonConfig |
	commonConfigFullName := self commonConfigFullName.
	[ 
			commonConfigFullName asFileReference exists ifFalse: [ FileDoesNotExistException signal ].
			jsonConfig := commonConfigFullName asFileReference readStream contents.
			^ readAndWrite := (NeoJSONObject fromString: jsonConfig) asOrderedCollection.
	] on: FileDoesNotExistException do: [ :ex|
				self createCommonConfigDirectory.
				self createCommonConfigFile.
				ex resume ]
]

{ #category : #accessing }
EIStorage3 class >> onlyWrite [
	^ onlyWrite ifNil: [ onlyWrite := OrderedCollection new. ]
]

{ #category : #accessing }
EIStorage3 class >> readAndWrite [
	^ readAndWrite ifNil: [
		readAndWrite := self loadCommonConfig.
		self createStorageDirectories.
		readAndWrite yourself ]
]

{ #category : #accessing }
EIStorage3 class >> readAndWrite: aReadAndWrite [
	readAndWrite := aReadAndWrite.
	
]

{ #category : #accessing }
EIStorage3 class >> reset [
	readAndWrite := nil.
	self readAndWrite.
]

{ #category : #accessing }
EIStorage3 >> at: aReference [
	"I read an object structure from file named anReference"
	| storageCollection storage |
	storageCollection := self class readAndWrite.
	storage := storageCollection at: (storageCollection size atRandom).
	^ self at: aReference from: storage.
]

{ #category : #accessing }
EIStorage3 >> at: aReference from: aStorage [
	| fileName contents res |
	fileName := aStorage, self config delimiter, aReference asString.
	contents := fileName asFileReference binaryReadStream contents.
	res := NeoJSONObject fromString: contents asString.
	^ res.
]

{ #category : #accessing }
EIStorage3 >> at: aReference put: anObjectStructure [
	"I write an object structure at file named anReference"
	self mutex critical: [ 
		self class readAndWrite do: [ :storagePath|
			self at: aReference put: anObjectStructure to: storagePath ]
	]

]

{ #category : #accessing }
EIStorage3 >> at: aReference put: anObjectStructure to: aStorage [
	| fileName byteArray |
	fileName := aStorage, self config delimiter, aReference asString.
	byteArray := (NeoJSONWriter toString: anObjectStructure) asByteString asByteArray.
	self atFile: fileName put: byteArray.
	
]

{ #category : #accessing }
EIStorage3 >> atFile: aFileName put: aByteArrayOrString [
	"можно оформить отдельным объектом"
	| wStream |
	wStream := aFileName asFileReference binaryWriteStream.
	wStream position: 0.
	wStream nextPutAll: aByteArrayOrString.
	wStream close.
	
]

{ #category : #accessing }
EIStorage3 >> config [
	^ EIConfiguration
]

{ #category : #accessing }
EIStorage3 >> masterStorage [
	^ EIMasterStorage new storage: self class readAndWrite first.
]

{ #category : #accessing }
EIStorage3 >> masterStorageв [
	"в качестве главного хранилища выбирается первый каталог из списка"
	^ EIMasterStorage new storage: self class readAndWrite first.
]
