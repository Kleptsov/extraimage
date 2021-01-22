Class {
	#name : #EIContext,
	#superclass : #Object,
	#instVars : [
		'storage',
		'selector',
		'references',
		'masterContext',
		'storageMonitor'
	],
	#category : #'ExtraImage-Core'
}

{ #category : #accessing }
EIContext class >> current [
	| context |
	context := self new.
	context selector: EISelectorInstance value.
	context storage: EIStorage3 new.
	^ context.
]

{ #category : #'loading and saving' }
EIContext >> loadObject: anObject [
	"loading an object"
	|ref|
	ref := selector keyAtValue: anObject.
	^ self loadReference: ref
]

{ #category : #'loading and saving' }
EIContext >> loadReference: aReference [
	"loading an object throuth a reference (an id)"
	| objectRecovery |
	references := nil.
	objectRecovery := EIObjectRecoveryFromStorage new
								context: self;
								reference: aReference;
								recovery.
	^ objectRecovery recoveredObject.
]

{ #category : #accessing }
EIContext >> masterContext [
	^ masterContext ifNil: [ 
			masterContext := EIMasterContext new context: self. ]
]

{ #category : #accessing }
EIContext >> masterContext: anObject [
	masterContext := anObject
]

{ #category : #accessing }
EIContext >> masterStorage [
	^ storage masterStorage
]

{ #category : #accessing }
EIContext >> referenceAt: aReference [
	| ref |
	aReference class = EIUUID ifTrue: [ ref := aReference asString ] ifFalse: [ ref := aReference ].
	^ self references at: ref
]

{ #category : #accessing }
EIContext >> referenceAt: aReference ifPresent: aBlock [
	| ref |
	aReference class = EIUUID ifTrue: [ ref := aReference asString ] ifFalse: [ ref := aReference ].
	self references
		at: ref
		ifPresent: [aBlock cull: (selector at: ref ifAbsent: [  ] ) ]
]

{ #category : #accessing }
EIContext >> referenceAt: aReference put: anObject [
	| ref |
	aReference class = EIUUID ifTrue: [ ref := aReference asString ] ifFalse: [ ref := aReference ].
	self references
		at: ref
		put: anObject
]

{ #category : #accessing }
EIContext >> references [
	^ references ifNil: [ references := Dictionary new ]
]

{ #category : #accessing }
EIContext >> references: anObject [
	references := anObject
]

{ #category : #'loading and saving' }
EIContext >> saveObject: anObject [
	"Saving an object to a storage"
	| dic |
	dic := EIAllObjectStructureBuilder new
		selector: selector;
		object: anObject;
		build.
		
	"self storageMonitor enter."
	dic keysAndValuesDo: [ :k :v|
		storage at: k put: v].
	"storageMonitor exit."
	^ dic.
]

{ #category : #accessing }
EIContext >> selector [
	^ selector
]

{ #category : #accessing }
EIContext >> selector: anObject [
	selector := anObject
]

{ #category : #accessing }
EIContext >> storage [
	^ storage
]

{ #category : #accessing }
EIContext >> storage: anObject [
	storage := anObject
]

{ #category : #accessing }
EIContext >> storageMonitor [
	^ storageMonitor ifNil: [ storageMonitor := EIStorageMonitor new ]
]
