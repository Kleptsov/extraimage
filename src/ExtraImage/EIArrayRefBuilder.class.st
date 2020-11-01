"
Создает ссылку на индексированные переменные
"
Class {
	#name : #EIArrayRefBuilder,
	#superclass : #Object,
	#instVars : [
		'reference'
	],
	#category : #'ExtraImage-JsonBuilder'
}

{ #category : #building }
EIArrayRefBuilder class >> reference: aReference [
	|inst|
	inst := self new.
	^ inst reference: aReference;
		build
]

{ #category : #building }
EIArrayRefBuilder >> build [
	reference class = EIUUID ifTrue: [ ^ reference asString ].
	^ reference.
]

{ #category : #accessing }
EIArrayRefBuilder >> reference [
	^ reference
]

{ #category : #accessing }
EIArrayRefBuilder >> reference: anObject [
	reference := anObject
]
