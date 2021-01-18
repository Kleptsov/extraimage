"
Конфигурация внешнего образа

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #EIConfiguration,
	#superclass : #Object,
	#classInstVars : [
		'clientId',
		'writeId',
		'imageId',
		'nextId'
	],
	#category : #'ExtraImage-Config'
}

{ #category : #accessing }
EIConfiguration class >> commonConfigFile [
	^ 'common.conf'
]

{ #category : #accessing }
EIConfiguration class >> delimiter [
	^ DiskStore delimiter asString.
]

{ #category : #accessing }
EIConfiguration class >> imageId [
	^ imageId ifNil: [ imageId := 1000000 atRandom ]
]

{ #category : #accessing }
EIConfiguration class >> localConfigFile [
	^ 'local.conf'
]

{ #category : #accessing }
EIConfiguration class >> localConfigFullName [
	^ self localConfigPath, self delimiter, self localConfigFile.
]

{ #category : #accessing }
EIConfiguration class >> localConfigPath [
	^ 'ei-config'
]

{ #category : #accessing }
EIConfiguration class >> localStorage [
	^ 'extra'
]

{ #category : #accessing }
EIConfiguration class >> nextId [
	nextId ifNil: [ nextId := self imageId * 1000000000 ].
	^ nextId := nextId + 1.
]

{ #category : #accessing }
EIConfiguration class >> referenceOf: anObject index: anIndex [
	^ anObject asNumber * 10000000000 + anIndex asNumber.
]

{ #category : #accessing }
EIConfiguration class >> writeId [
	^ writeId ifNil: [ writeId := 2097152 atRandom ]
]
