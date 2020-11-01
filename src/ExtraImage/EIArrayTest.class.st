Class {
	#name : #EIArrayTest,
	#superclass : #TestCase,
	#instVars : [
		'array'
	],
	#category : #'ExtraImage-Tests'
}

{ #category : #tests }
EIArrayTest >> setUp [
	array := EIArray new.
]

{ #category : #tests }
EIArrayTest >> testAt [
	array at: 10 put: 'ExtraImage'.
	self assert: (array at: 10) equals: 'ExtraImage'
]

{ #category : #tests }
EIArrayTest >> testAtPut [
	array at: 10 put: 'ExtraImage'.
	self assert: (array at: 10) equals: 'ExtraImage'.
]

{ #category : #tests }
EIArrayTest >> testCollect [
	| coll result|
	array at: 1 put: 1.
	array at: 100000 put: 100000.
	array at: 200000 put: 200000.
	coll := array collect: [ :el| el + 100 ].
	result := coll size.
	self assert: result equals: 3.
	self assert: (coll at: 1) equals: 101.
	self assert: (coll at: 2) equals: 100100.
	self assert: (coll at: 3) equals: 200100.
]

{ #category : #tests }
EIArrayTest >> testDo [
	| res |
	res := 0.
	array at: 1 put: 1.
	array at: 100000 put: 100000.
	array at: 200000 put: 200000.
	array do: [ :el| res := res + el ].
	self assert: res equals: 300001.
]

{ #category : #tests }
EIArrayTest >> testSelect [
	| coll result|
	coll := OrderedCollection new.
	array at: 1 put: 1.
	array at: 100000 put: 100000.
	array at: 200000 put: 200000.
	coll := array select: [ :el| el < 150000].
	result := coll size.
	self assert: result equals: 2.
	self assert: (coll at: 1) equals: 1.
	self assert: (coll at: 2) equals: 100000.
]
