Class {
	#name : #EIObjectCreator,
	#superclass : #Object,
	#instVars : [
		'objectStructure',
		'reference',
		'context',
		'object'
	],
	#category : #'ExtraImage-Recovery'
}

{ #category : #accessing }
EIObjectCreator >> context [
	^ context
]

{ #category : #accessing }
EIObjectCreator >> context: anObject [
	context := anObject
]

{ #category : #creating }
EIObjectCreator >> create [
	| indexSize className |
	indexSize := (objectStructure at: '_indexes_' ifAbsent: [{}]) size.
	className := (objectStructure at: '_class_') asSymbol.
	className = #WideString
		ifTrue: [ object := WideString new: (indexSize =0 ifTrue: [0] ifFalse: [(indexSize /4) asInteger max: 1 ]) ]
		ifFalse: [ object := (Smalltalk at: className) newObject: indexSize ].
	context selector at: reference put: object.
	^ object.
]

{ #category : #accessing }
EIObjectCreator >> object [
	^ object
]

{ #category : #accessing }
EIObjectCreator >> object: anObject [
	object := anObject
]

{ #category : #accessing }
EIObjectCreator >> objectStructure [
	^ objectStructure
]

{ #category : #accessing }
EIObjectCreator >> objectStructure: anObject [
	objectStructure := anObject
]

{ #category : #accessing }
EIObjectCreator >> reference [
	^ reference
]

{ #category : #accessing }
EIObjectCreator >> reference: anObject [
	reference := anObject
]
