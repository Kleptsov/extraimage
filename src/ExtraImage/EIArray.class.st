"
массив с реализацией выборки

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	array:		<Object>
	index:		<Object>
	map:		<Object>
	range:		<Object>


    Implementation Points
"
Class {
	#name : #EIArray,
	#superclass : #EICollection,
	#instVars : [
		'array',
		'map',
		'range',
		'index',
		'monitor'
	],
	#category : #'ExtraImage-Collection'
}

{ #category : #accessing }
EIArray >> at: anIndex [
	^ array at: anIndex
]

{ #category : #accessing }
EIArray >> at: anIndex put: anObject [
	| i |
	array at:anIndex put: anObject.
	anObject ifNil: [ ^ self removeAt: anIndex. ].
	monitor enter.
	(map at: anIndex)
		ifNil: [		i := index value.
						range at: i put: anIndex.
						map at: anIndex put: i.
						index value: (i + 1) ].
	monitor exit.
]

{ #category : #enumerating }
EIArray >> collect: aBlock [
	| coll |
	coll := OrderedCollection new.
	self do: [ :el| coll add: (aBlock value: el) ].
	^ coll.
]

{ #category : #enumerating }
EIArray >> do: aBlock [
	| el |
	1 to: index value - 1 do: [ :i|
		el := array at: (range at: i).
		el ifNotNil: [ aBlock value: el ] ]
]

{ #category : #accessing }
EIArray >> index [
	^ index
]

{ #category : #accessing }
EIArray >> index: anObject [
	index := anObject
]

{ #category : #initialization }
EIArray >> initialize [
	super initialize.
	array := EISimpleArray new.
	map := EISimpleArray new.
	range := EISimpleArray new.
	index := EILightReference new value: 1.
	monitor := EIMonitor new.
]

{ #category : #accessing }
EIArray >> monitor [
	^ monitor ifNil: [ monitor := EIMonitor new ]
]

{ #category : #removing }
EIArray >> removeAt: anIndex [
	array at: anIndex put: nil.
	"требуется доработка"
	
]

{ #category : #enumerating }
EIArray >> select: aBlock [
	| res el |
	res := OrderedCollection new.
	1 to: index value - 1 do: [ :i|
		el := array at: (range at: i).
		el ifNotNil: [ (aBlock value: el)
									ifTrue: [ res add: el ] ] ].
	^ res.
]

{ #category : #accessing }
EIArray >> size [
	|s|
	s := 0.
	self do: [ :el| 
		el ifNotNil: [ s := s + 1 ] ].
	^ s
]
