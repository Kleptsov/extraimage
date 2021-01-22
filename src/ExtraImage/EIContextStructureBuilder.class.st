Class {
	#name : #EIContextStructureBuilder,
	#superclass : #Object,
	#instVars : [
		'object',
		'dictionary'
	],
	#category : #'ExtraImage-JsonBuilder'
}

{ #category : #builder }
EIContextStructureBuilder class >> object: aString [
	^ self new object: aString; build
]

{ #category : #building }
EIContextStructureBuilder >> build [
	dictionary at: '_class_' put: 'Context'.
	^ dictionary
]

{ #category : #initialize }
EIContextStructureBuilder >> initialize [
	super initialize.
	dictionary := Dictionary new.
]

{ #category : #accessing }
EIContextStructureBuilder >> object [
	^ object
]

{ #category : #accessing }
EIContextStructureBuilder >> object: anObject [
	object := anObject
]
