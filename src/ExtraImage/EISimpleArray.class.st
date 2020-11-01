"
простой массив, может только записывать и читать по определенному индексу.  Возможность выборки отсутствует

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	id:		<Object>


    Implementation Points
"
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
	ref := EIUUID fromByteArray: (SHA1 hashMessage: (id, index asByteArray)) asByteArray.
	[res := (EIContextInstance value loadReference: ref) object]
		on: Error
		do: [ :ex| res := nil ].
	^ res
]

{ #category : #accessing }
EISimpleArray >> at: index put: anObject [
	| ref container |
	ref := EIUUID fromByteArray: (SHA1 hashMessage: (id asByteArray, index asByteArray)) asByteArray.
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
	id := EIUUID new asByteArray.
]
