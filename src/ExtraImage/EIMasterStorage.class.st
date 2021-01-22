Class {
	#name : #EIMasterStorage,
	#superclass : #AbstractStorage,
	#instVars : [
		'storage'
	],
	#category : #'ExtraImage-Storage'
}

{ #category : #accessing }
EIMasterStorage >> at: aReference [
	"I read an object structure from file named anReference"
	| content fileName |
	fileName := storage, self config delimiter, aReference asString.
	content := fileName asFileReference binaryReadStream contents.
	^ NeoJSONObject fromString: content asString.
]

{ #category : #accessing }
EIMasterStorage >> at: anReference put: anObjectStructure [
	"I write an object structure at file named anReference"
	| fileStream fileName |
	self mutex critical: [
		fileName := storage, self config delimiter, anReference asString.
		fileStream := fileName asFileReference binaryWriteStream.
		fileStream position: 0.
		fileStream nextPutAll: (NeoJSONWriter toString: anObjectStructure).
		fileStream close].
]

{ #category : #accessing }
EIMasterStorage >> masterStorage [
	^ self
]

{ #category : #accessing }
EIMasterStorage >> storage: aStorage [
	storage := aStorage
]
