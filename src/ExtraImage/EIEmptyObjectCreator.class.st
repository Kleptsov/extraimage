Class {
	#name : #EIEmptyObjectCreator,
	#superclass : #Object,
	#instVars : [
		'objectStructure',
		'cls',
		'indexSize'
	],
	#category : #'ExtraImage-Recovery'
}

{ #category : #operations }
EIEmptyObjectCreator >> create [
	cls := (objectStructure at: '_class_') asSymbol.
	cls = #WideString ifTrue: [ ^ self createWideString ].
	cls = #ByteString ifTrue: [ ^ self createByteString ].
	^ self createStandardObject.
	
	
	
]

{ #category : #operations }
EIEmptyObjectCreator >> createByteString [
	^ EIByteStringRecovery new
			objectStructure: objectStructure;
			recovery.
	
	
]

{ #category : #operations }
EIEmptyObjectCreator >> createStandardObject [
	| object |
	indexSize := (objectStructure at: '_indexes_' ifAbsent: [{}]) size.
	object := (Smalltalk at: cls) newObject: indexSize.
	^ objectStructure at: '_status_' put: 'ok';
		at: '_object_' put: object.
	
	
	
]

{ #category : #operations }
EIEmptyObjectCreator >> createWideString [
	^ EIWideStringRecovery new
			objectStructure: objectStructure;
			recovery.
]

{ #category : #accessing }
EIEmptyObjectCreator >> objectStructure [
	^ objectStructure
]

{ #category : #accessing }
EIEmptyObjectCreator >> objectStructure: anObject [
	objectStructure := anObject
]
