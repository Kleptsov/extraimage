Class {
	#name : #EIOrderedCollection,
	#superclass : #EICollection,
	#instVars : [
		'firstIndex',
		'lastIndex',
		'array',
		'monitor'
	],
	#category : #'ExtraImage-Collection'
}

{ #category : #'adding & removing' }
EIOrderedCollection >> add: anObject [
	self addLast: anObject.
		
]

{ #category : #'adding & removing' }
EIOrderedCollection >> addFirst: anObject [
	| i |
	monitor enter.
	i := firstIndex value.
	firstIndex value: i - 1.
	array at: i put: anObject.
	monitor exit.
		
]

{ #category : #'adding & removing' }
EIOrderedCollection >> addLast: anObject [
	| i |
	monitor enter.
	i := lastIndex value.
	lastIndex value: i + 1.
	array at: i put: anObject.
	monitor exit.
		
]

{ #category : #acccessing }
EIOrderedCollection >> at: anIndex [

	^ array at: anIndex
]

{ #category : #acccessing }
EIOrderedCollection >> at: anIndex put: anObject [
	monitor enter. 
	anIndex < firstIndex value
		ifTrue: [ firstIndex value: anIndex ].
	anIndex > lastIndex value
		ifTrue: [ lastIndex value: anIndex ].
	array at: anIndex put: anObject.
	monitor exit.
	
]

{ #category : #testing }
EIOrderedCollection >> capacity [
	^ lastIndex value - firstIndex value - 1.
]

{ #category : #enumerating }
EIOrderedCollection >> collect: aBlock [
	^ array collect: aBlock
]

{ #category : #enumerating }
EIOrderedCollection >> do: aBlock [
	array do: aBlock
]

{ #category : #acccessing }
EIOrderedCollection >> first [
	^ array at: firstIndex value + 1
]

{ #category : #initialization }
EIOrderedCollection >> initialize [
	super initialize.
	firstIndex := EILightReference new value: 999999.
	lastIndex := EILightReference new value: 1000000.
	monitor := EIMonitor new.
	array := EIArray new.
]

{ #category : #acccessing }
EIOrderedCollection >> last [
	^ array at: lastIndex value - 1
]

{ #category : #'adding & removing' }
EIOrderedCollection >> removeFirst [
	| i |
	monitor enter.
	i := firstIndex value.
	firstIndex value: i + 1.
	array at: i put: nil.
	monitor exit.
]

{ #category : #'adding & removing' }
EIOrderedCollection >> removeLast [
	| i |
	monitor enter.
	i := lastIndex value.
	lastIndex value: i - 1.
	array at: i put: nil.
	monitor exit.
]

{ #category : #enumerating }
EIOrderedCollection >> select: aBlock [
	^ array select: aBlock
]

{ #category : #testing }
EIOrderedCollection >> size [
	^ array size.
]
