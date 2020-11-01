Class {
	#name : #EIHexToWideStringTest,
	#superclass : #TestCase,
	#category : #'ExtraImage-Tests'
}

{ #category : #accessing }
EIHexToWideStringTest >> testBuild [
	| hex res |
	hex := 'D09FD180D0B8D0B2D0B5D18220D0BCD0B8D180'.
	res := EIHexToWideString new hexString: hex; build.
	self assert: res equals: 'Привет мир'
	
]
