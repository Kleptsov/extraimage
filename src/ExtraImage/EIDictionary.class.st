"
Внешний словарь, в отличие от обычного словаря имеет неограниченный размер. В качестве ключа используется хеш объекта, важно позаботиться о хеше чтобы избежать ошибок.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
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
