Class {
	#name : #EISetTest,
	#superclass : #TestCase,
	#instVars : [
		'set'
	],
	#category : #'ExtraImage-Tests'
}

{ #category : #tests }
EISetTest >> setUp [
	set := EISet new.
]

{ #category : #tests }
EISetTest >> testAdd [
	| coll1 coll2 |
	set add: 1000.
	set add: 'polymorphism'.
	coll1 := set select: [ :el| el = 1000 ].
	self assert: coll1 size equals: 1.
	self assert: coll1 first = 1000.
	coll2 := set select: [ :el| el = 'polymorphism' ].
	self assert: coll2 size equals: 1.
	self assert: coll2 first = 'polymorphism'
]

{ #category : #tests }
EISetTest >> testRemove [
	| coll1 coll2 |
	set add: 1000.
	set add: 'set'.
	coll1 := set select: [ :el| el = 1000 ].
	self assert: coll1 size equals: 1.
	set remove: 1000.
	coll1 := set select: [ :el| el = 100 ].
	self assert: coll1 size equals: 0.
	coll2 := set select: [ :el| el = 'set' ].
	self assert: coll2 size equals: 1.
	set remove: 'set'.
	coll2 := set select: [ :el| el = 'set' ].
	self assert: coll2 size equals: 0.
]
