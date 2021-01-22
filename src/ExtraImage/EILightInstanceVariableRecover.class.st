Class {
	#name : #EILightInstanceVariableRecover,
	#superclass : #Object,
	#instVars : [
		'variableName',
		'variableValue',
		'recoveredObject',
		'context'
	],
	#category : #'ExtraImage-Recovery'
}

{ #category : #accessing }
EILightInstanceVariableRecover >> context [
	^ context
]

{ #category : #accessing }
EILightInstanceVariableRecover >> context: anObject [
	context := anObject
]

{ #category : #accessing }
EILightInstanceVariableRecover >> recoveredObject [
	^ recoveredObject
]

{ #category : #accessing }
EILightInstanceVariableRecover >> recoveredObject: anObject [
	recoveredObject := anObject
]

{ #category : #recovering }
EILightInstanceVariableRecover >> recovery [
	| val t|
	(variableValue = nil or: [ variableValue or: [ variableValue not or: [ variableValue class = SmallInteger ] ] ])
			ifTrue: [ recoveredObject instVarAt: variableName put: variableValue ].
	t := EILightObjectFromStorage new
				context: context;
				reference: variableValue.
	val := t recovery.
	recoveredObject instVarAt: variableName put: val.
	^ t objectStructure.
]

{ #category : #accessing }
EILightInstanceVariableRecover >> variableName [
	^ variableName
]

{ #category : #accessing }
EILightInstanceVariableRecover >> variableName: anObject [
	variableName := anObject
]

{ #category : #accessing }
EILightInstanceVariableRecover >> variableValue [
	^ variableValue
]

{ #category : #accessing }
EILightInstanceVariableRecover >> variableValue: anObject [
	variableValue := anObject
]
