"
Контейнер для простого массива.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	object:		<Object>


    Implementation Points
"
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
