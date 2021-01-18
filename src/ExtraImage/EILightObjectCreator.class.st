Class {
	#name : #EILightObjectCreator,
	#superclass : #Object,
	#instVars : [
		'context',
		'reference',
		'objectStructure',
		'cache',
		'storageCache',
		'varReferences',
		'indReferences',
		'object'
	],
	#category : #'ExtraImage-Recovery'
}

{ #category : #recovering }
EILightObjectCreator >> connectVariables [
	| allInstVarNames obj |
	object := objectStructure at: '_object_'.
	allInstVarNames := (Smalltalk at: (objectStructure at: '_class_') asSymbol) allInstVarNames.
	1 to: allInstVarNames size do: [ :index|
		objectStructure at: (allInstVarNames at: index)
			ifPresent: [ :varName|
				obj := objectStructure at: '_references_'.
				object instVarAt: index put: nil
		] ]
]

{ #category : #accessing }
EILightObjectCreator >> context [
	^ context
]

{ #category : #accessing }
EILightObjectCreator >> context: anObject [
	context := anObject
]

{ #category : #recovering }
EILightObjectCreator >> loadReferences [
	| varRef |
	varRef := objectStructure at: '_references_' put: Dictionary new.
	varReferences do: [ :ref| varRef at: ref put: (storageCache at: ref) ].
	indReferences do: [ :ref| varRef at: ref put: (storageCache at: ref) ]
]

{ #category : #recovering }
EILightObjectCreator >> recovery [
	storageCache := context store storageCache.
	objectStructure := storageCache at: reference.
	EIEmptyObjectCreator new objectStructure: objectStructure; create.
	varReferences := EIVariableReferencesBuilder new objectStructure: objectStructure; build.
	indReferences := EIIndexesReferencesBuilder new objectStructure: objectStructure; build.
	self loadVarReferences.
	self loadIndReferences.
]

{ #category : #accessing }
EILightObjectCreator >> reference [
	^ reference
]

{ #category : #accessing }
EILightObjectCreator >> reference: anObject [
	reference := anObject
]
