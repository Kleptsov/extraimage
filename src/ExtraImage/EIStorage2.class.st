"
Хранилище вложенное в рабочую  директорию Pharo

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
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
	^ NeoJSONObject fromString: content asString.
]

{ #category : #accessing }
EIStorage2 >> at: anReference put: anObjectStructure [
	"I write an object structure at file named anReference"
	| path fileStream |
	self mutex critical: [
		path := self class defaultDirectory / anReference asString.
		fileStream := (path asFileReference openWritable: true)
							writeStream binary reset.
		fileStream nextPutAll: (NeoJSONWriter toString: anObjectStructure).
		fileStream close].
]

{ #category : #accessing }
EIStorage2 >> masterStorage [
	^ self
]
