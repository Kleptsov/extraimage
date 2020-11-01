Class {
	#name : #EIVariablesRecovery,
	#superclass : #Object,
	#instVars : [
		'objectStructure',
		'recoveredObject',
		'context'
	],
	#category : #'ExtraImage-Recovery'
}

{ #category : #accessing }
EIVariablesRecovery >> context [
	^ context
]

{ #category : #accessing }
EIVariablesRecovery >> context: anObject [
	context := anObject
]

{ #category : #accessing }
EIVariablesRecovery >> objectStructure [
	^ objectStructure
]

{ #category : #accessing }
EIVariablesRecovery >> objectStructure: anObject [
	objectStructure := anObject
]

{ #category : #accessing }
EIVariablesRecovery >> recoveredObject [
	^ recoveredObject
]

{ #category : #accessing }
EIVariablesRecovery >> recoveredObject: anObject [
	recoveredObject := anObject
]

{ #category : #recovering }
EIVariablesRecovery >> recovery [
	|varNames varName valOrRef|
	varNames := recoveredObject class allInstVarNames.
	1 to: varNames size do: [ :index|
		varName := varNames at: index.
		objectStructure at: varName ifPresent: [ 
			valOrRef := objectStructure at: varName.
			valOrRef mayBeReference ifTrue: [ 
				valOrRef := EIObjectRecoveryFromStorage new
					context: context;
					reference: valOrRef;
					recovery;
					recoveredObject ].
				recoveredObject instVarAt: index put: valOrRef
			 ] ]
]
