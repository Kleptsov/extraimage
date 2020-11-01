Class {
	#name : #EIOrderedCollectionTest,
	#superclass : #TestCase,
	#instVars : [
		'collection'
	],
	#category : #'ExtraImage-Tests'
}

{ #category : #tests }
EIOrderedCollectionTest >> setUp [
	collection := EIOrderedCollection new.
]

{ #category : #tests }
EIOrderedCollectionTest >> testAdd [
	collection add: 'collection'.
	self assert: (collection last) equals: 'collection'.
]

{ #category : #tests }
EIOrderedCollectionTest >> testAddFirst [
	collection addFirst: 'collection'.
	self assert: (collection first) equals: 'collection'.
]

{ #category : #tests }
EIOrderedCollectionTest >> testAddLast [
	collection addLast: 'collection'.
	self assert: (collection last) equals: 'collection'.
]

{ #category : #tests }
EIOrderedCollectionTest >> testAt [
	collection at: 100 put: 'OK'.
	self assert: (collection at: 100) equals: 'OK'
]

{ #category : #tests }
EIOrderedCollectionTest >> testAtPut [
	collection at: 100 put: 'OK'.
	self assert: (collection at: 100) equals: 'OK'
]

{ #category : #tests }
EIOrderedCollectionTest >> testRemoveFirst [
	collection addFirst: 'first'.
	self assert: (collection capacity) equals: 1.
	self assert: (collection first) equals: 'first'.
	collection removeFirst.
	self assert: (collection capacity) equals: 0.
]

{ #category : #tests }
EIOrderedCollectionTest >> testRemoveLast [
	collection addLast: 'last'.
	self assert: (collection capacity) equals: 1.
	self assert: (collection last) equals: 'last'.
	collection removeLast.
	self assert: (collection capacity) equals: 0.
]
