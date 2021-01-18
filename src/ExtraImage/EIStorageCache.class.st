Class {
	#name : #EIStorageCache,
	#superclass : #Object,
	#instVars : [
		'storage',
		'cache',
		'objects'
	],
	#category : #'ExtraImage-Storage'
}

{ #category : #accessing }
EIStorageCache >> at: anReference [
	| ref |
	ref := anReference asString.
	^ cache at: ref ifAbsent: [ cache at: ref put: (storage at: anReference) ]
]

{ #category : #accessing }
EIStorageCache >> at: anReference put: anObjectStructure [
	| ref |
	ref := anReference asString.
	cache at: ref put: anObjectStructure.
	storage at: ref put: anObjectStructure.
]

{ #category : #accessing }
EIStorageCache >> at: anReference putObject: anObjectStructure [
	| ref |
	ref := anReference asString.
	objects at: ref put: anObjectStructure.
]

{ #category : #accessing }
EIStorageCache >> cache [
	^ cache
]

{ #category : #accessing }
EIStorageCache >> cache: anObject [
	cache := anObject
]

{ #category : #initialization }
EIStorageCache >> initialize [
	super initialize.
	cache := Dictionary new.
	objects := Dictionary new.
]

{ #category : #accessing }
EIStorageCache >> storage [
	^ storage
]

{ #category : #accessing }
EIStorageCache >> storage: anObject [
	storage := anObject
]
