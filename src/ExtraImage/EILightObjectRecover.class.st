Class {
	#name : #EILightObjectRecover,
	#superclass : #Object,
	#instVars : [
		'objectStructure',
		'selector',
		'reference',
		'recoveredObject',
		'context'
	],
	#category : #'ExtraImage-Recovery'
}

{ #category : #accessing }
EILightObjectRecover >> context [
	^ context
]

{ #category : #accessing }
EILightObjectRecover >> context: anObject [
	context := anObject
]

{ #category : #recovering }
EILightObjectRecover >> createObject [
	recoveredObject := EIObjectCreator new
								context: context;
								reference: reference;
								objectStructure: objectStructure;
								create.
	^ recoveredObject.
]

{ #category : #accessing }
EILightObjectRecover >> objectStructure [
	^ objectStructure
]

{ #category : #accessing }
EILightObjectRecover >> objectStructure: anObject [
	objectStructure := anObject
]

{ #category : #accessing }
EILightObjectRecover >> recoveredObject [
	^ recoveredObject
]

{ #category : #accessing }
EILightObjectRecover >> recoveredObject: anObject [
	recoveredObject := anObject
]

{ #category : #recovering }
EILightObjectRecover >> recovery [
	|   |
	recoveredObject := context selector
							at: reference
							ifAbsent: [ self createObject ].
	recoveredObject ifNil: [ self createObject ].
	^ recoveredObject.
]

{ #category : #accessing }
EILightObjectRecover >> reference [
	^ reference
]

{ #category : #accessing }
EILightObjectRecover >> reference: anObject [
	anObject isString
		ifTrue: [ reference := EIUUID fromString: anObject ]
		ifFalse: [ reference := anObject ]
]
