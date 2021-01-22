Class {
	#name : #EIWideStringRecovery,
	#superclass : #Object,
	#instVars : [
		'objectStructure',
		'recoveredObject',
		'string'
	],
	#category : #'ExtraImage-Recovery'
}

{ #category : #accessing }
EIWideStringRecovery >> objectStructure [
	^ objectStructure
]

{ #category : #accessing }
EIWideStringRecovery >> objectStructure: anObject [
	objectStructure := anObject
]

{ #category : #accessing }
EIWideStringRecovery >> recoveredObject [
	^ recoveredObject
]

{ #category : #accessing }
EIWideStringRecovery >> recoveredObject: anObject [
	recoveredObject := anObject
]

{ #category : #recovering }
EIWideStringRecovery >> recovery [
	string := objectStructure at: '_indexes_'.
	recoveredObject := EIHexToWideString new hexString: string; build.
	objectStructure at: '_object_' put: recoveredObject;
		at: '_status_' put: 'ok'.
	^ recoveredObject.
	"1 to: string size do: [ :index|
		recoveredObject byteAt: index put: (string at: index) ]."
]
