Class {
	#name : #EISimpleArray,
	#superclass : #EICollection,
	#instVars : [
		'id'
	],
	#category : #'ExtraImage-Collection'
}

{ #category : #accessing }
EISimpleArray >> at: index [
	| ref res|
	"ref := EIUUID fromByteArray: (SHA1 hashMessage: (id, index asByteArray)) asByteArray."
	ref := EIConfiguration referenceOf: id asNumber index: index.
	[res := (EIContextInstance value loadReference: ref) object]
		on: Error
		do: [ :ex| res := nil ].
	^ res
]

{ #category : #accessing }
EISimpleArray >> at: index put: anObject [
	| ref container |
	"ref := EIUUID fromByteArray: (SHA1 hashMessage: (id asByteArray, index asByteArray)) asByteArray."
	ref := (EIConfiguration referenceOf: id index: index) asString.
	container := EIContainer new object: anObject.
	EIContextInstance value selector at: ref put: container.
	EIContextInstance value saveObject: container.
	^ anObject
]

{ #category : #accessing }
EISimpleArray >> id [
	^ id
]

{ #category : #accessing }
EISimpleArray >> id: anObject [
	id := anObject
]

{ #category : #initialize }
EISimpleArray >> initialize [
	super initialize.
	"id := EIUUID new asByteArray."
	id := (EIConfiguration nextId) numerator.
]
