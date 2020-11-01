"
Создаетс ассоциацию вида aVarName -> aEIUUID.
Экземпляры Nil, Boolean, SmallInteger сохраняются по значению вместо EIUUID ссылки
"
Class {
	#name : #EIAssociationBuilder,
	#superclass : #Object,
	#instVars : [
		'variableName',
		'reference',
		'association'
	],
	#category : #'ExtraImage-JsonBuilder'
}

{ #category : #building }
EIAssociationBuilder >> build [
	association key: variableName.
	reference ifNil: [ ^ association value: nil; yourself ].
	reference class superclass = Boolean
		ifTrue: [ ^ association value: reference; yourself ].
	reference class = SmallInteger
		ifTrue: [ ^ association value: reference; yourself ].
	reference class = EIUUID
		ifTrue: [ ^ association value: reference asString ].
	^ Error signal: 'DictionaryRefBuilder error'.
]

{ #category : #initialize }
EIAssociationBuilder >> initialize [
	super initialize.
	association := Association new.
]

{ #category : #accessing }
EIAssociationBuilder >> reference [
	^ reference
]

{ #category : #accessing }
EIAssociationBuilder >> reference: anObject [
	reference := anObject
]

{ #category : #accessing }
EIAssociationBuilder >> variableName [
	^ variableName
]

{ #category : #accessing }
EIAssociationBuilder >> variableName: anObject [
	variableName := anObject
]
