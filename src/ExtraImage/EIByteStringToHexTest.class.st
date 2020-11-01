Class {
	#name : #EIByteStringToHexTest,
	#superclass : #TestCase,
	#category : #'ExtraImage-Tests'
}

{ #category : #tests }
EIByteStringToHexTest >> testBuild [
	| str res |
	str := 'abc'.
	res := EIByteStringToHex new string: str; build.
	self assert: res equals: '616263'.
]
