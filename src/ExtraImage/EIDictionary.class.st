Class {
	#name : #EIDictionary,
	#superclass : #EICollection,
	#instVars : [
		'array'
	],
	#category : #'ExtraImage-Collection'
}

{ #category : #acccessing }
EIDictionary >> at: aKey [
	| hash |
	hash := aKey eiHash.
	^ (array at: hash) value.
]

{ #category : #acccessing }
EIDictionary >> at: aKey put: anObject [
	| hash |
	hash := aKey eiHash.
	array at: hash put: (Association key: aKey value: anObject).
]

{ #category : #enumerating }
EIDictionary >> do: aBlock [
	self valuesDo: aBlock.
]

{ #category : #initialization }
EIDictionary >> initialize [
	super initialize.
	array := EIArray new.
]

{ #category : #enumerating }
EIDictionary >> keysAndValuesDo: aBlock [
	array do: [ :assoc| 
		aBlock value: assoc key value: assoc value ]
]

{ #category : #enumerating }
EIDictionary >> keysDo: aBlock [
	array do: [ :assoc|
		aBlock value: assoc key ]

]

{ #category : #enumerating }
EIDictionary >> select: aBlock [
	|dictionary|
	dictionary := Dictionary new.
	array do: [ :assoc|
		(aBlock value: assoc value)
			ifTrue: [ dictionary at: assoc key put: assoc value ] ].
	^ dictionary.
]

{ #category : #enumerating }
EIDictionary >> valuesDo: aBlock [
	array do: [ :assoc|
		aBlock value: assoc value ]
]
