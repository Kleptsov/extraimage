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
		'writeId'
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
EIConfiguration class >> writeId [
	^ writeId ifNil: [ writeId := 2097152 atRandom ]
]
