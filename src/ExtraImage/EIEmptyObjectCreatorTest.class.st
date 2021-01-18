Class {
	#name : #EIEmptyObjectCreatorTest,
	#superclass : #TestCase,
	#category : #'ExtraImage-Tests'
}

{ #category : #tests }
EIEmptyObjectCreatorTest >> testCreateByteString [
	| objectStructure creator |
	objectStructure := { 
		'_class_' -> 'ByteString'.
		'_indexes_' -> (EIByteStringToHex new string: 'Hello world.'; build) 
	 } asDictionary.
	creator := EIEmptyObjectCreator new.
	creator objectStructure: objectStructure;
		create.
	self assert: 'Hello world.' equals: (objectStructure at: '_object_')
]

{ #category : #tests }
EIEmptyObjectCreatorTest >> testCreateStandardObject [
	| objectStructure creator |
	objectStructure := { 
		'_class_' -> 'Array'.
		'_indexes_' -> { 1. 2. 3. 4. 5. }
	 } asDictionary.
	creator := EIEmptyObjectCreator new.
	creator objectStructure: objectStructure;
		create.
	self assert: Array equals: (objectStructure at: '_object_') class.
	self assert: 5 equals: (objectStructure at: '_object_') size.
	
	objectStructure := { 
		'_class_' -> 'Point'.
	 } asDictionary.
	creator objectStructure: objectStructure;
		create.
	self assert: Point equals: (objectStructure at: '_object_') class.
]

{ #category : #tests }
EIEmptyObjectCreatorTest >> testCreateWideString [
	| objectStructure creator |
	objectStructure := { 
		'_class_' -> 'WideString'.
		'_indexes_' -> (EIWideStringToHex new wideString: 'Привет мир.'; build) 
	 } asDictionary.
	creator := EIEmptyObjectCreator new.
	creator objectStructure: objectStructure;
		create.
	self assert: 'Привет мир.' equals: (objectStructure at: '_object_')
]
