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
