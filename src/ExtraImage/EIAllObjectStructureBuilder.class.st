Class {
	#name : #EIAllObjectStructureBuilder,
	#superclass : #Object,
	#instVars : [
		'dictionary',
		'selector',
		'object'
	],
	#category : #'ExtraImage-JsonBuilder'
}

{ #category : #building }
EIAllObjectStructureBuilder >> build [
	"создает словарь структурированных объектов"
	| structure ref |
	[ 
		structure := EIObjectStructureBuilder object: object selector: selector.
		ref := selector keyAtValue: object.
		dictionary at: ref ifPresent: [ ^ dictionary ].
		dictionary at: ref put: structure.
	] on: EIDoesNotCreateStructureException do: [ :ex| ^ dictionary ].
	self isState ifFalse: [ ^ dictionary ].
	self buildVariables.
	self buildIndexes.
	^ dictionary
]

{ #category : #building }
EIAllObjectStructureBuilder >> buildIndexes [
	"добавление с словарь индексированных ссылок"
	| val  basicSize |
	basicSize := object basicSize.
	basicSize = 0 ifTrue: [ ^ self ].
	1 to: basicSize do: [ :index| 
		val := object basicAt: index.
		self class new
			dictionary: dictionary;
			object: val;
			selector: selector;
			build ].
]

{ #category : #building }
EIAllObjectStructureBuilder >> buildVariables [	
	"добавление в словарь структурированных объектов переменных с ссылками"
	| val |
	"varNames := object class allInstVarNamesEverywhere."
	1 to: object class instSize do: [ :index|
		val := object instVarAt: index.
		self class new
			dictionary: dictionary;
			object: val;
			selector: selector;
			build]
	
]

{ #category : #accessing }
EIAllObjectStructureBuilder >> dictionary [
	^ dictionary
]

{ #category : #accessing }
EIAllObjectStructureBuilder >> dictionary: anObject [
	dictionary := anObject
]

{ #category : #initialize }
EIAllObjectStructureBuilder >> initialize [
	super initialize.
	dictionary := Dictionary new.
]

{ #category : #building }
EIAllObjectStructureBuilder >> isReference [
	"возвращает истиру если объект может имеет ссылку"
	| ref objectClass |
	ref := selector keyAtValue: object.
	ref ifNil: [ ^ false ].
	objectClass := ref class.
	objectClass = SmallInteger ifTrue: [ ^ false ].
	objectClass superclass = Boolean ifTrue: [ ^ false ].
	^ true
]

{ #category : #building }
EIAllObjectStructureBuilder >> isState [
	| objectClass |
	objectClass := object class.
	objectClass = ByteString ifTrue: [ ^ false ].
	objectClass = WideString ifTrue: [ ^ false ].
	objectClass = BlockClosure ifTrue: [ ^ false ].
	objectClass = Context ifTrue: [ ^ false ].
	^ true
]

{ #category : #accessing }
EIAllObjectStructureBuilder >> object [
	^ object
]

{ #category : #accessing }
EIAllObjectStructureBuilder >> object: anObject [
	object := anObject
]

{ #category : #accessing }
EIAllObjectStructureBuilder >> selector [
	^ selector
]

{ #category : #accessing }
EIAllObjectStructureBuilder >> selector: anObject [
	selector := anObject
]
