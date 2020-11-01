"
Создает структуру ByteString
"
Class {
	#name : #EIStringStructureBuilder,
	#superclass : #Object,
	#instVars : [
		'object',
		'dictionary'
	],
	#category : #'ExtraImage-JsonBuilder'
}

{ #category : #builder }
EIStringStructureBuilder class >> string: aString [
	^ self new object: aString; build
]

{ #category : #building }
EIStringStructureBuilder >> build [
	dictionary at: '_class_' put: 'ByteString'.
	dictionary at: '_indexes_' put: (EIByteStringToHex new string: object; build).
	"dictionary at: '_indexes_' put: object."
	^ dictionary
]

{ #category : #initialize }
EIStringStructureBuilder >> initialize [
	super initialize.
	dictionary := Dictionary new.
]

{ #category : #accessing }
EIStringStructureBuilder >> object [
	^ object
]

{ #category : #accessing }
EIStringStructureBuilder >> object: anObject [
	object := anObject
]
