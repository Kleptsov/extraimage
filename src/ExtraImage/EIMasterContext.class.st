"
Контекст имеющий ссылку на главное хранилище

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	context:		<Object>


    Implementation Points
"
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
