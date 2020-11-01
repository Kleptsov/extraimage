"
множество неограниченного размера

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #EISet,
	#superclass : #EICollection,
	#instVars : [
		'array',
		'length'
	],
	#category : #'ExtraImage-Collection'
}

{ #category : #accessing }
EISet class >> length [
	^ 1000
]

{ #category : #'adding & removing' }
EISet >> add: anObject [
	| index |
	index := self findEmptyIndexFor: anObject.
	index = 0 ifTrue: [ ^ nil ].
	array at: index put: anObject.
	^ anObject.
]

{ #category : #accessing }
EISet >> array [
	^ array
]

{ #category : #accessing }
EISet >> array: anObject [
	array := anObject
]

{ #category : #enumerating }
EISet >> collect: aBlock [
	^ array collect: aBlock
]

{ #category : #enumerating }
EISet >> do: aBlock [
	array do: aBlock.
]

{ #category : #'private ' }
EISet >> findEmptyIndexFor: anObject [
	|res start end |
	start := anObject eiHash.
	res := array at: start.
	res ifNil: [ ^ start ].
	end := start + self length.
	(start + 1) to: end do: [ :index|
		(array at: index) ifNil: [ ^ index ] ].
	^ 0.
]

{ #category : #initialize }
EISet >> initialize [
	super initialize.
	array := EIArray new.
	self length.
]

{ #category : #accessing }
EISet >> length [
	^ length ifNil: [ self class length ]
]

{ #category : #accessing }
EISet >> length: aLength [
	length := aLength asNumber.
]

{ #category : #'private ' }
EISet >> like: anObject [
	"Answer an object in the receiver that is equal to anObject,
	nil if no such object is found. Relies heavily on hash properties.
	Note, use #like:ifAbsent: if you need to match against nil as element"

	^ self like: anObject ifAbsent: [ nil ]
]

{ #category : #'private ' }
EISet >> like: anObject ifAbsent: aBlock [
	"Answer an object in the receiver that is equal to anObject,
	or evaluate the block if not found. Relies heavily on hash properties"
	| element index |
	index := (self scanFor: anObject) value.
	index = 0 ifTrue: [ ^ aBlock value ].
	element := array at: index.
	^ element ifNil: [ aBlock value ] ifNotNil: [ element enclosedElement ]
]

{ #category : #'adding & removing' }
EISet >> remove: anObject [
	| start end index|
	index := self scanFor: anObject.
	index = 0 ifFalse: [ 
			array at: index put: nil
		].
	^ anObject.
]

{ #category : #'private ' }
EISet >> scanFor: anObject [
	|res start end h |
	h := anObject eiHash.
	res := array at: h.
	res = anObject
		ifTrue: [ ^ h ]
		ifFalse: [ start := h + 1.
						end := start + self length.
						start to: end do: [ :index|
							(array at: index) = anObject ifTrue: [ ^ index ] ] ].
	^ 0.
]

{ #category : #enumerating }
EISet >> select: aBlock [
	|coll|
	coll := OrderedCollection new.
	array do: [ :el|
		(aBlock value: el) ifTrue: [ coll add: el ] ].
	^ coll.
]

{ #category : #accessing }
EISet >> size [
	|s|
	s := 0.
	self do: [ :el| 
		el ifNotNil: [ s := s + 1 ] ].
	^ s
]
