Class {
	#name : #EILightObjectFromStorage,
	#superclass : #Object,
	#instVars : [
		'reference',
		'objectStructure',
		'recoveredObject',
		'context'
	],
	#category : #'ExtraImage-Recovery'
}

{ #category : #accessing }
EILightObjectFromStorage >> context [
	^ context
]

{ #category : #accessing }
EILightObjectFromStorage >> context: anObject [
	context := anObject
]

{ #category : #accessing }
EILightObjectFromStorage >> objectStructure [
	^ objectStructure
]

{ #category : #accessing }
EILightObjectFromStorage >> objectStructure: anObject [
	objectStructure := ((objectStructure class == ByteArray)
		or: [ objectStructure isString ])
		ifTrue: ["NeoJSONObject" STON fromString: anObject ]
		ifFalse: [ anObject ]
]

{ #category : #recovering }
EILightObjectFromStorage >> recovery [
	objectStructure := context storage at: reference.
	recoveredObject := EILightObjectRecover new
								context: context;
								reference: reference;
								objectStructure: objectStructure;
								recovery.
	^ recoveredObject.
]

{ #category : #accessing }
EILightObjectFromStorage >> reference [
	^ reference
]

{ #category : #accessing }
EILightObjectFromStorage >> reference: anObject [
	"anObject isString
		ifTrue: [ reference := EIUUID fromString: anObject ]
		ifFalse: [ reference := anObject ]"
	reference := anObject asString
]
