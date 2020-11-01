Class {
	#name : #EIMonotorTest,
	#superclass : #TestCase,
	#instVars : [
		'monitor'
	],
	#category : #'ExtraImage-Tests'
}

{ #category : #tests }
EIMonotorTest >> setUp [
	monitor := Monitor new.
]

{ #category : #tests }
EIMonotorTest >> testEnter [
	| x |
	x := 0.
	[ 
		monitor enter.
		(Delay forSeconds: 4) wait.
		x := 10.
		monitor exit.
	 ] fork.

	(Delay forSeconds: 1) wait.

	[ 
		monitor enter.
		x := 100.
		monitor exit.
	 ] fork.

	(Delay forSeconds: 6) wait.
	
	self assert: x equals: 100.
]
