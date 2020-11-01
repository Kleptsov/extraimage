Class {
	#name : #EIHexToByteStringTest,
	#superclass : #TestCase,
	#category : #'ExtraImage-Tests'
}

{ #category : #tests }
EIHexToByteStringTest >> testBuild [
	| hex res |
	hex := '616263'.
	res := EIHexToByteString new hexString: hex; build.
	self assert: res equals: 'abc'.
]
