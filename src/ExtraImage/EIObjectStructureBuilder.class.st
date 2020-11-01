"
Создает структуру для всех типов объектов, кроме экземпляров Nil, Boolean, SmallInteger.
Может возбуждать исключительную ситуацию EIDoesNotCreateStructureExcepton
"
Class {
	#name : #EIObjectStructureBuilder,
	#superclass : #Object,
	#instVars : [
		'object',
		'selector',
		'dictionary'
	],
	#category : #'ExtraImage-JsonBuilder'
}

{ #category : #building }
EIObjectStructureBuilder class >> object: anObject selector: aSelector [
	| inst |
	inst := self new.
	^ inst object: anObject;
		selector: aSelector;
		build
]

{ #category : #building }
EIObjectStructureBuilder >> build [
	| objectClass |
	object mayBeReference ifFalse: [EIDoesNotCreateStructureException signal].
	objectClass := object class.
	objectClass = ByteString ifTrue: [ ^ EIStringStructureBuilder string: object ].
	objectClass = WideString ifTrue: [ ^ EIWideStringStructureBuilder string: object ].
	objectClass = BlockClosure ifTrue: [ ^ EIBlockStructureBuilder object: object ].
	objectClass = Context ifTrue: [ ^ EIContextStructureBuilder object: object ].
	dictionary at: '_class_' put: objectClass asString.
	self buildVariables.
	self buildIndexes.
	^ dictionary
]

{ #category : #building }
EIObjectStructureBuilder >> buildIndexes [
	| val ref basicSize array|
	basicSize := object basicSize.
	basicSize = 0 ifTrue: [ ^ self ].
	array := Array new: basicSize.
	1 to: basicSize do: [ :index| 
		val := object basicAt: index.
		ref := selector keyAtValue: val.
		array at: index put: (EIArrayRefBuilder reference: ref) ].
	dictionary at: '_indexes_' put: array.
]

{ #category : #building }
EIObjectStructureBuilder >> buildVariables [
	| val ref assRef|
	"varNames := object class allInstVarNamesEverywhere."
	1 to: object class instSize do: [ :index|
		val := object instVarAt: index.
		ref := selector keyAtValue: val.
		assRef := EIAssociationBuilder new
			reference: ref;
			variableName: (self variableNameFor: index of: object);
			build.
		dictionary add: assRef. ]
]

{ #category : #accessing }
EIObjectStructureBuilder >> dictionary [
	^ dictionary
]

{ #category : #accessing }
EIObjectStructureBuilder >> dictionary: anObject [
	dictionary := anObject
]

{ #category : #initialize }
EIObjectStructureBuilder >> initialize [
	super initialize.
	dictionary := Dictionary new.
]

{ #category : #testing }
EIObjectStructureBuilder >> isReference [
	object ifNil: [ ^ false ].
	object class = SmallInteger ifTrue: [ ^ false ].
	object class superclass = Boolean ifTrue: [ ^ false ].
	^ true
]

{ #category : #accessing }
EIObjectStructureBuilder >> object [
	^ object
]

{ #category : #accessing }
EIObjectStructureBuilder >> object: anObject [
	object := anObject
]

{ #category : #accessing }
EIObjectStructureBuilder >> selector [
	^ selector
]

{ #category : #accessing }
EIObjectStructureBuilder >> selector: anObject [
	selector := anObject
]

{ #category : #building }
EIObjectStructureBuilder >> variableNameFor: anIndex of: anObject [
	"Answer the named instance variable with index index or nil if none."
	"we deprecate this as it is not useful know that we have meta objects for variables"

	| slot |
	slot := object class classLayout allSlots 
		detect: [ :each | each isVirtual not and: [ each index = anIndex ] ] ifNone: [^nil].
	^slot name
]
