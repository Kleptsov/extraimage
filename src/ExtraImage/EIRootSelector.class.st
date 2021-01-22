Class {
	#name : #EIRootSelector,
	#superclass : #EICollection,
	#classInstVars : [
		'instance'
	],
	#category : #'ExtraImage-Collection'
}

{ #category : #accessing }
EIRootSelector class >> at: aKey [
	^ self instance at: aKey
]

{ #category : #accessing }
EIRootSelector class >> at: aKey put: anObject [
	self instance at: aKey put: anObject.
	^ anObject.
]

{ #category : #accessing }
EIRootSelector class >> instance [
	instance ifNil: [ 
		"попытка загрузить из базы"
		[ 
			EIContextInstance value loadReference: EIUUID rootSelector ] 
				on: Error do: [ 
					"в базе не нейдено"
					self instance: EIDictionary new. ] ].
	^ instance.
]

{ #category : #accessing }
EIRootSelector class >> instance: anInstance [
	instance := anInstance.
	EIContextInstance value selector
		at: (EIUUID rootSelector) put: anInstance.
	EIContextInstance value saveObject: anInstance.
]

{ #category : #accessing }
EIRootSelector class >> reload [
	instance := self instance.
	self instance: instance.
]

{ #category : #accessing }
EIRootSelector class >> reset [
	self instance: EIDictionary new.
]
