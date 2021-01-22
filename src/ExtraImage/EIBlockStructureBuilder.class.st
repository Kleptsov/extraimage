Class {
	#name : #EIBlockStructureBuilder,
	#superclass : #Object,
	#instVars : [
		'object',
		'dictionary'
	],
	#category : #'ExtraImage-JsonBuilder'
}

{ #category : #builder }
EIBlockStructureBuilder class >> object: aString [
	^ self new object: aString; build
]

{ #category : #building }
EIBlockStructureBuilder >> build [
	dictionary at: '_class_' put: 'BlockClosure'.
	^ dictionary
]

{ #category : #initialize }
EIBlockStructureBuilder >> initialize [
	super initialize.
	dictionary := Dictionary new.
]

{ #category : #accessing }
EIBlockStructureBuilder >> object [
	^ object
]

{ #category : #accessing }
EIBlockStructureBuilder >> object: anObject [
	object := anObject
]
