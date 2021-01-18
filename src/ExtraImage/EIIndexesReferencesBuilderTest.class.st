Class {
	#name : #EIIndexesReferencesBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'objectStructure',
		'builder',
		'res'
	],
	#category : #'ExtraImage-Tests'
}

{ #category : #tests }
EIIndexesReferencesBuilderTest >> setUp [
	builder := EIIndexesReferencesBuilder new.
]

{ #category : #tests }
EIIndexesReferencesBuilderTest >> testBuild [
	objectStructure := { '_class_' -> 'Array'. '_indexes_' -> { '1234'. '1235'. 7. nil. '1237' } } asDictionary.
	builder objectStructure: objectStructure.
	res := builder build.
	self assert: { '1234'. '1235'. '1237' } equals: res.
	
]
