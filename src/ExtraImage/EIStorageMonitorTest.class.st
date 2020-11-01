Class {
	#name : #EIStorageMonitorTest,
	#superclass : #TestCase,
	#instVars : [
		'monitor'
	],
	#category : #'ExtraImage-Tests'
}

{ #category : #tests }
EIStorageMonitorTest >> setUp [
	monitor := EIStorageMonitor new.
]

{ #category : #tests }
EIStorageMonitorTest >> testEnter [
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
