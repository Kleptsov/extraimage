Class {
	#name : #EIVariableReferencesBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'objectStructure',
		'builder',
		'res'
	],
	#category : #'ExtraImage-Tests'
}

{ #category : #tests }
EIVariableReferencesBuilderTest >> setUp [
	builder := EIVariableReferencesBuilder new.
]

{ #category : #tests }
EIVariableReferencesBuilderTest >> testBuild [
	objectStructure := { '_class_' -> 'Point'. 'x' -> '123456789'. 'y' -> '1234567891'. 'z' -> '123'  } asDictionary.
	builder objectStructure: objectStructure.
	res := builder build.
	self assert: { '123456789'. '1234567891' } equals: res.
]
