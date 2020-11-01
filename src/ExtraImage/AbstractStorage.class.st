"
Абстрактный класс хранилища

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #AbstractStorage,
	#superclass : #Object,
	#classInstVars : [
		'mutex'
	],
	#category : #'ExtraImage-Storage'
}

{ #category : #'class initialization' }
AbstractStorage class >> config [
	^ EIConfiguration
]

{ #category : #accessing }
AbstractStorage class >> mutex [
	^ mutex ifNil: [ mutex := Mutex new ]
]

{ #category : #accessing }
AbstractStorage class >> mutex: aMutex [
	mutex := aMutex
]

{ #category : #accessing }
AbstractStorage >> at: aReference [
	"I read an object structure from file named anReference"
	^ self subclassResponsibility
]

{ #category : #accessing }
AbstractStorage >> at: anReference put: anObjectStructure [
	"I write an object structure at file named anReference"
	^ self subclassResponsibility
]

{ #category : #accessing }
AbstractStorage >> config [
	^ EIConfiguration
]

{ #category : #accessing }
AbstractStorage >> masterStorage [
	"главное хранилище в репликации"
	^ self subclassResponsibility
]

{ #category : #accessing }
AbstractStorage >> mutex [
	"^ mutex ifNil: [ mutex := Mutex new ]"
	^ self class mutex.
]
