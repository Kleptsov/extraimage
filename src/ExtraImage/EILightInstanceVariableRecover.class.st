"
Легкое восстановление переменных. Объекты переменных востанавливаются поверхносно.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	context:		<Object>
	recoveredObject:		<Object>
	variableName:		<Object>
	variableValue:		<Object>


    Implementation Points
"
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
	(variableValue = nil or: [ variableValue = true or: [ variableValue = false or: [ variableValue class = SmallInteger ] ] ])
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
