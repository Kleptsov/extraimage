"
Легкое восстановление объекта, без рекурсии в переменные

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	context:		<Object>
	objectStructure:		<Object>
	recoveredObject:		<Object>
	reference:		<Object>


    Implementation Points
"
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
