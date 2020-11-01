"
Получатель ответа

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #ResponseReceiver,
	#superclass : #Object,
	#category : #'ExtraImage-Tmp-WebScanner'
}

{ #category : #receiving }
ResponseReceiver >> receive: aResponse url: anUrl [
	(EIRootSelector at: 'webscan')
			ifNil: [ (EIRootSelector at: 'webscan' put: EIOrderedCollection new)
								add: (anUrl -> aResponse) ]
			ifNotNil: [ :ws| ws add: (anUrl -> aResponse) ]
]
