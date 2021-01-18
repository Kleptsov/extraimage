Class {
	#name : #EIIndexesReferencesBuilder,
	#superclass : #Object,
	#instVars : [
		'objectStructure',
		'res',
		'indexes'
	],
	#category : #'ExtraImage-Recovery'
}

{ #category : #building }
EIIndexesReferencesBuilder >> build [
	| cls |
	cls := objectStructure at: '_class_'.
	(cls = 'WideString' or: [ cls = 'ByteString' ])
		ifTrue: [ ^ objectStructure at: '_indexesReferences_' put: { } ].
	indexes := (objectStructure at: '_indexes_' ifAbsent: [ {  } ]).
	res := indexes select: [ :el|
					el class = ByteString ].
	objectStructure at: '_indexReferences_' put: res.
	^ res.
]

{ #category : #accessing }
EIIndexesReferencesBuilder >> objectStructure [
	^ objectStructure
]

{ #category : #accessing }
EIIndexesReferencesBuilder >> objectStructure: anObject [
	objectStructure := anObject
]
