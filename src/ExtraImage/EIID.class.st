Class {
	#name : #EIID,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : #'ExtraImage-Core'
}

{ #category : #accessing }
EIID class >> value: aValue [
	^ self new id: aValue
]

{ #category : #converting }
EIID >> asNumber [
	^ id asNumber
]

{ #category : #converting }
EIID >> asString [
	^ id asString
]

{ #category : #accessing }
EIID >> id [
	^ id
]

{ #category : #accessing }
EIID >> id: anObject [
	id := anObject
]

{ #category : #printing }
EIID >> printOn: aStream [
	aStream nextPutAll: id asString;
		nextPutAll: '-id'.
]

{ #category : #accessing }
EIID >> value [
	^ id
]

{ #category : #accessing }
EIID >> value: aValue [
	id := aValue
]
