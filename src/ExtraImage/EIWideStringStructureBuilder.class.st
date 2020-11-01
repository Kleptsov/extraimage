"
Создает структуру WideString
"
Class {
	#name : #EIWideStringStructureBuilder,
	#superclass : #Object,
	#instVars : [
		'object',
		'dictionary'
	],
	#category : #'ExtraImage-JsonBuilder'
}

{ #category : #building }
EIWideStringStructureBuilder class >> string: aString [
	^ self new object: aString; build
]

{ #category : #building }
EIWideStringStructureBuilder >> build [
	dictionary at: '_class_' put: 'WideString'.
	"dictionary at: '_indexes_' put: (object asByteArray)."
	dictionary at: '_indexes_' put: (EIWideStringToHex new wideString: object; build).
	^ dictionary
]

{ #category : #initialize }
EIWideStringStructureBuilder >> initialize [
	super initialize.
	dictionary := Dictionary new.
]

{ #category : #accessing }
EIWideStringStructureBuilder >> object [
	^ object
]

{ #category : #accessing }
EIWideStringStructureBuilder >> object: anObject [
	object := anObject
]
