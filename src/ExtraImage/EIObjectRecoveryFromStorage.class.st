Class {
	#name : #EIObjectRecoveryFromStorage,
	#superclass : #Object,
	#instVars : [
		'reference',
		'references',
		'recoveredObject',
		'objectStructure',
		'context'
	],
	#category : #'ExtraImage-Recovery'
}

{ #category : #accessing }
EIObjectRecoveryFromStorage >> context [
	^ context
]

{ #category : #accessing }
EIObjectRecoveryFromStorage >> context: anObject [
	context := anObject
]

{ #category : #accessing }
EIObjectRecoveryFromStorage >> recoveredObject [
	^ recoveredObject
]

{ #category : #accessing }
EIObjectRecoveryFromStorage >> recoveredObject: anObject [
	recoveredObject := anObject
]

{ #category : #recovering }
EIObjectRecoveryFromStorage >> recovery [
	|t recoveredObjectClass|
	context
		referenceAt: reference
		ifPresent: [:r| recoveredObject := r. ^ self ].
	context referenceAt: reference put: true.
	t := EILightObjectFromStorage new
			context: context;
			reference: reference.
	recoveredObject := t recovery.
	recoveredObjectClass := recoveredObject class.
	(recoveredObjectClass = BlockClosure or: [ recoveredObjectClass = Process or: [ recoveredObjectClass = Context ] ])
		ifTrue: [ ^ self ]. "восстановление только по ссылке"
	objectStructure := t objectStructure.
	recoveredObjectClass = ByteString ifTrue: [ ^ self recoveryByteString ].
	recoveredObjectClass = WideString ifTrue: [ ^ self recoveryWideString ].
	self recoveryVariables.
	self recoveryIndexes.
	
]

{ #category : #recovering }
EIObjectRecoveryFromStorage >> recoveryByteString [
	recoveredObject := 
		EIByteStringRecovery new
			objectStructure: objectStructure;
			recoveredObject: recoveredObject;
			recovery.
]

{ #category : #recovering }
EIObjectRecoveryFromStorage >> recoveryIndexes [
	EIIndexesRecovery new
		recoveredObject: recoveredObject;
		objectStructure: objectStructure;
		context: context;
		recovery.

]

{ #category : #recovering }
EIObjectRecoveryFromStorage >> recoveryVariables [
	EIVariablesRecovery new
		objectStructure: objectStructure;
		context: context;
		recoveredObject: recoveredObject;
		recovery.

]

{ #category : #recovering }
EIObjectRecoveryFromStorage >> recoveryWideString [
	recoveredObject := 
		EIWideStringRecovery new
			objectStructure: objectStructure;
			recoveredObject: recoveredObject;
			recovery.
]

{ #category : #accessing }
EIObjectRecoveryFromStorage >> reference [
	^ reference
]

{ #category : #accessing }
EIObjectRecoveryFromStorage >> reference: anObject [
	"anObject isString
		ifTrue: [ reference := EIUUID fromString: anObject ]
		ifFalse: [ reference := anObject ]"
	reference :=anObject asString.
]

{ #category : #accessing }
EIObjectRecoveryFromStorage >> references [
	^ references ifNil: [ references := Dictionary new ]
]

{ #category : #accessing }
EIObjectRecoveryFromStorage >> references: anObject [
	references := anObject
]
