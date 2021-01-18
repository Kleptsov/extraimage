Class {
	#name : #EISimpleArrayTest,
	#superclass : #TestCase,
	#instVars : [
		'array'
	],
	#category : #'ExtraImage-Tests'
}

{ #category : #running }
EISimpleArrayTest >> setUp [
	array := EISimpleArray new.
]

{ #category : #tests }
EISimpleArrayTest >> testAt [
	array at: 10 put: 'ExtraImage'.
	self assert: (array at: 10) equals: 'ExtraImage'
]
