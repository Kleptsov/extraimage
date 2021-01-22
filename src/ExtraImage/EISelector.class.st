Class {
	#name : #EISelector,
	#superclass : #Object,
	#instVars : [
		'counter',
		'selector'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'ExtraImage-Core'
}

{ #category : #accessing }
EISelector class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #accessing }
EISelector class >> resetInstance [
	instance := nil
]

{ #category : #accessing }
EISelector >> at: aReference ifAbsent: aBlock [
	| ref |
	ref := aReference isString
		ifTrue: [ Number readFrom: aReference ]
		ifFalse: [ aReference asNumber ].
	^ selector at: ref ifAbsent: aBlock.
	"ref := EIUUID from: aReference.
	^ selector at: ref ifAbsent: aBlock."
]

{ #category : #accessing }
EISelector >> at: aReference put: anObject [
	| ref |
	ref := aReference asNumber.
	selector at: ref put: anObject
	"selector at: (EIUUID from: aReference) put: anObject"
]

{ #category : #initialize }
EISelector >> clean [
	"Cleans unused references"
	counter ifNil: [ counter := 0 ].
	counter := counter + 1.
	counter > 1000 ifTrue: [
		counter := 0.
		(selector select: [ :el| (el == nil) ])
			keysAndValuesDo: [:k :v| selector removeKey: k ] ]
]

{ #category : #initialize }
EISelector >> initialize [
	counter := 0.
	selector := WeakValueDictionary new.
]

{ #category : #accessing }
EISelector >> keyAtValue: anObject [
	self clean.
	^ EIReferenceBuilder object: anObject selector: selector.
]

{ #category : #accessing }
EISelector >> selector [
	^ selector
]
