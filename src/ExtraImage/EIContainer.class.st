Class {
	#name : #EIContainer,
	#superclass : #Object,
	#instVars : [
		'object'
	],
	#category : #'ExtraImage-Collection'
}

{ #category : #accessing }
EIContainer >> object [
	^ object
]

{ #category : #accessing }
EIContainer >> object: anObject [
	object := anObject
]

{ #category : #accessing }
EIContainer >> value [
	^ self object.
]

{ #category : #accessing }
EIContainer >> value: anObject [
	self object: anObject.
]
