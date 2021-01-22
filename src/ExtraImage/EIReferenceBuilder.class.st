Class {
	#name : #EIReferenceBuilder,
	#superclass : #Object,
	#instVars : [
		'selector',
		'object'
	],
	#category : #'ExtraImage-Core'
}

{ #category : #creating }
EIReferenceBuilder class >> object: anObject selector: aSelector [
	|inst|
	inst := self new.
	^ inst object: anObject;
		selector: aSelector;
		build.
]

{ #category : #building }
EIReferenceBuilder >> build [
	| id |
	object ifNil: [ ^ nil ].
	object class = SmallInteger ifTrue: [ ^ object ].
	object class superclass = Boolean ifTrue: [ ^ object ].
	^ selector
		keyAtIdentityValue: object
		ifAbsent: [
			id := EIConfiguration nextId.
			selector at: id put: object.
			EIID value: id.
			"uuid := EIUUID new.
			selector at: uuid put: object.
			uuid yourself "]
]

{ #category : #accessing }
EIReferenceBuilder >> object [
	^ object
]

{ #category : #accessing }
EIReferenceBuilder >> object: anObject [
	object := anObject
]

{ #category : #accessing }
EIReferenceBuilder >> selector [
	^ selector
]

{ #category : #accessing }
EIReferenceBuilder >> selector: anObject [
	selector := anObject
]
