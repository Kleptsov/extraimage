Class {
	#name : #EIMasterLightReferenceTest,
	#superclass : #TestCase,
	#instVars : [
		'mReference'
	],
	#category : #'ExtraImage-Tests'
}

{ #category : #tests }
EIMasterLightReferenceTest >> setUp [
	mReference := EIMasterLightReference new.
]

{ #category : #tests }
EIMasterLightReferenceTest >> testValue [
	mReference value: 'abc'.
	self assert: mReference value equals: 'abc'.
	mReference value: nil.
	self assert: mReference value equals: nil
]
