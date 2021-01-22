Class {
	#name : #EIIndexesRecovery,
	#superclass : #Object,
	#instVars : [
		'objectStructure',
		'recoveredObject',
		'indexes',
		'context'
	],
	#category : #'ExtraImage-Recovery'
}

{ #category : #accessing }
EIIndexesRecovery >> context [
	^ context
]

{ #category : #accessing }
EIIndexesRecovery >> context: anObject [
	context := anObject
]

{ #category : #accessing }
EIIndexesRecovery >> objectStructure [
	^ objectStructure
]

{ #category : #accessing }
EIIndexesRecovery >> objectStructure: anObject [
	objectStructure := anObject
]

{ #category : #accessing }
EIIndexesRecovery >> recoveredObject [
	^ recoveredObject
]

{ #category : #accessing }
EIIndexesRecovery >> recoveredObject: anObject [
	recoveredObject := anObject
]

{ #category : #recovering }
EIIndexesRecovery >> recovery [
	| valOrRef |
	objectStructure at: '_indexes_' ifAbsent: [ ^ self ].
	indexes := objectStructure at: '_indexes_'.
	1 to: indexes size do: [ :index|
		valOrRef := indexes at: index.
		valOrRef mayBeReference ifTrue: [ 
			valOrRef := EIObjectRecoveryFromStorage new
							context: context;
							reference: valOrRef;
							recovery;
							recoveredObject ].
		recoveredObject basicAt: index put: valOrRef ]

]
