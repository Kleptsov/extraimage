Class {
	#name : #EIWideStringToHexTest,
	#superclass : #TestCase,
	#category : #'ExtraImage-Tests'
}

{ #category : #tests }
EIWideStringToHexTest >> testBuild [
	| wStr res |
	wStr := 'Привет мир'.
	res := EIWideStringToHex new wideString: wStr; build.
	self assert: res equals: 'D09FD180D0B8D0B2D0B5D18220D0BCD0B8D180'
]
