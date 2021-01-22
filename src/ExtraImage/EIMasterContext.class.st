Class {
	#name : #EIMasterContext,
	#superclass : #EIContext,
	#instVars : [
		'context'
	],
	#category : #'ExtraImage-Core'
}

{ #category : #accessing }
EIMasterContext >> context: aContext [
	context := aContext.
	selector := context selector.
	storage := context masterStorage.
]

{ #category : #accessing }
EIMasterContext >> masterContext [
	^ self
]

{ #category : #accessing }
EIMasterContext >> masterContext: aMasterContext [

]

{ #category : #'loading and saving' }
EIMasterContext >> saveObject: anObject [
	"Saving an object to a storage"
	| dic |
	dic := EIAllObjectStructureBuilder new
		selector: selector;
		object: anObject;
		build.
		
	dic keysAndValuesDo: [ :k :v|
		storage at: k put: v].
	^ dic.
]
