Class {
	#name : #EIDictionaryTest,
	#superclass : #TestCase,
	#instVars : [
		'dictionary'
	],
	#category : #'ExtraImage-Tests'
}

{ #category : #'as yet unclassified' }
EIDictionaryTest >> setUp [
	dictionary := EIDictionary new.
]

{ #category : #tests }
EIDictionaryTest >> testAt [
	| testString key |
	testString := 'Hello from Pharo Smalltalk'.
	key := '125'.
	dictionary at: key put: testString.
	self assert: (dictionary at: key) equals: testString.
]

{ #category : #tests }
EIDictionaryTest >> testAtPut [
	| testString key |
	testString := 'Hello from Pharo Smalltalk'.
	key := '125'.
	dictionary at: key put: testString.
	self assert: (dictionary at: key) equals: testString.
]

{ #category : #tests }
EIDictionaryTest >> testKeysAndValuesDo [
	| coll |
	coll := OrderedCollection new.
	dictionary at: '1' put: 100.
	dictionary at: 'key' put: 200.
	dictionary at: 'key2' put: 300.
	dictionary keysAndValuesDo: [ :k :v| coll add: (Association key: k value: v) ].
	self assert: (coll at: 1) key equals: '1'.
	self assert: (coll at: 2) key equals: 'key'.
	self assert: (coll at: 3) key equals: 'key2'.
	self assert: (coll at: 1) value equals: 100.
	self assert: (coll at: 2) value equals: 200.
	self assert: (coll at: 3) value equals: 300.
]

{ #category : #tests }
EIDictionaryTest >> testKeysDo [
	| keys |
	keys := OrderedCollection new.
	dictionary at: '1' put: 100.
	dictionary at: 'key' put: 200.
	dictionary at: 'key2' put: 300.
	dictionary keysDo: [ :k| keys add: k ].
	self assert: (keys at: 1) equals: '1'.
	self assert: (keys at: 2) equals: 'key'.
	self assert: (keys at: 3) equals: 'key2'
]

{ #category : #tests }
EIDictionaryTest >> testSelect [
	| res |
	dictionary at: '1' put: 100.
	dictionary at: 'key' put: 200.
	dictionary at: 'key2' put: 300.
	res := dictionary select: [ :v| v < 220 ].
	self assert: (res at: '1') equals: 100.
	self assert: (res at: 'key') equals: 200. 
]

{ #category : #tests }
EIDictionaryTest >> testValuesDo [
	| coll |
	coll := OrderedCollection new.
	dictionary at: '1' put: 'EIDictionary'.
	dictionary at: 'key' put: 'value'.
	dictionary at: 'key2' put: 'value2'.
	dictionary valuesDo: [ :v| coll add: v ].
	self assert: coll equals: (OrderedCollection with: 'EIDictionary' with: 'value' with: 'value2'). 
]
