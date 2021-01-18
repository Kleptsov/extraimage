Class {
	#name : #EIVariableReferencesBuilder,
	#superclass : #Object,
	#instVars : [
		'objectStructure',
		'className',
		'variables',
		'res'
	],
	#category : #'ExtraImage-Recovery'
}

{ #category : #building }
EIVariableReferencesBuilder >> build [
	className := (objectStructure at: '_class_') asSymbol.
	variables := (Smalltalk at: className) allInstVarNames.
	res := variables
			select: [ :var| (objectStructure at: var ifAbsent: [nil]) class = ByteString ]
			thenCollect: [ :var| (objectStructure at: var) ].
	objectStructure at: '_varReferences_' put: res.
	^ res.
]

{ #category : #accessing }
EIVariableReferencesBuilder >> objectStructure [
	^ objectStructure
]

{ #category : #accessing }
EIVariableReferencesBuilder >> objectStructure: anObject [
	objectStructure := anObject
]
