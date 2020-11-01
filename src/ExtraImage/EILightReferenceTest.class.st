Class {
	#name : #EILightReferenceTest,
	#superclass : #TestCase,
	#instVars : [
		'lightReference'
	],
	#category : #'ExtraImage-Tests'
}

{ #category : #tests }
EILightReferenceTest >> setUp [
	lightReference := EILightReference new.
]

{ #category : #tests }
EILightReferenceTest >> testValue [
	lightReference value: 'OK'.
	self assert: lightReference value equals: 'OK'.
]
