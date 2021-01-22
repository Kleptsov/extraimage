Class {
	#name : #EIByteStringRecovery,
	#superclass : #Object,
	#instVars : [
		'objectStructure',
		'recoveredObject',
		'string'
	],
	#category : #'ExtraImage-Recovery'
}

{ #category : #accessing }
EIByteStringRecovery >> objectStructure [
	^ objectStructure
]

{ #category : #accessing }
EIByteStringRecovery >> objectStructure: anObject [
	objectStructure := anObject
]

{ #category : #accessing }
EIByteStringRecovery >> recoveredObject [
	^ recoveredObject
]

{ #category : #accessing }
EIByteStringRecovery >> recoveredObject: anObject [
	recoveredObject := anObject
]

{ #category : #recovering }
EIByteStringRecovery >> recovery [
	string := objectStructure at: '_indexes_'.
	"1 to: string size do: [ :index|
		recoveredObject byteAt: index put: (string byteAt: index) ]"
	recoveredObject := EIHexToByteString new hexString: string; build.
	objectStructure at: '_object_' put: recoveredObject;
		at: '_status_' put: 'ok'.
	^ recoveredObject.
]
