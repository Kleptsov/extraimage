Class {
	#name : #EIStorage2,
	#superclass : #AbstractStorage,
	#category : #'ExtraImage-Storage'
}

{ #category : #accessing }
EIStorage2 class >> defaultDirectory [
	^ FileSystem workingDirectory / 'extra'.
]

{ #category : #accessing }
EIStorage2 class >> initialize [
	self defaultDirectory createDirectory.
]

{ #category : #accessing }
EIStorage2 >> at: anReference [
	"I read an object structure from file named anReference"
	
	|path content |
	path := self class defaultDirectory / anReference asString.
	content := path asFileReference readStream contents.
	^ "NeoJSONObject" STON fromString: content asString.
]

{ #category : #accessing }
EIStorage2 >> at: anReference put: anObjectStructure [
	"I write an object structure at file named anReference"
	| path fileStream |
	self mutex critical: [
		path := self class defaultDirectory / anReference asString.
		"fileStream := (path asFileReference openWritable: true)
							writeStream binary reset."
		fileStream := path asFileReference binaryWriteStream.
		fileStream nextPutAll: ("NeoJSONWriter" STON toString: anObjectStructure).
		fileStream close].
]

{ #category : #accessing }
EIStorage2 >> masterStorage [
	^ self
]
