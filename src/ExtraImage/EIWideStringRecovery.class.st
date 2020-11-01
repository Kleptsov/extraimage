"
Восстанавливает WideString из шестнадцатиричной кодировки

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	objectStructure:		<Object>
	recoveredObject:		<Object>
	string:		<Object>


    Implementation Points
"
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
	^ recoveredObject := EIHexToWideString new hexString: string; build.
	"1 to: string size do: [ :index|
		recoveredObject byteAt: index put: (string at: index) ]."
]
