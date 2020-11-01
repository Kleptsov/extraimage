"
Создает или возвращает uuid ссылку на объект.
У экземпляров Nil, SmallInteger, Boolean вместо ссылки возвращается сам объект
"
Class {
	#name : #EIReferenceBuilder,
	#superclass : #Object,
	#instVars : [
		'selector',
		'object'
	],
	#category : #'ExtraImage-JsonBuilder'
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
	|uuid|
	object ifNil: [ ^ nil ].
	object class = SmallInteger ifTrue: [ ^ object ].
	object class superclass = Boolean ifTrue: [ ^ object ].
	^ selector
		keyAtIdentityValue: object
		ifAbsent: [
			uuid := EIUUID new.
			selector at: uuid put: object.
			uuid yourself ]
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
