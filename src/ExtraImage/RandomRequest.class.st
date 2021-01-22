Class {
	#name : #RandomRequest,
	#superclass : #Object,
	#instVars : [
		'request',
		'url',
		'timeout',
		'response'
	],
	#category : #'ExtraImage-Tmp-WebScanner'
}

{ #category : #requesting }
RandomRequest >> get [
	[
	response := 
		request timeout: timeout; url: url; get; response.
	ResponseReceiver new receive: response url: url.
	self log: 'Ok ', url.
		]	on: Error
			do: [ :ex| self log: ex messageText ].
]

{ #category : #initialize }
RandomRequest >> initialize [
	super initialize.
	timeout := 20.
	request := ZnEasy client.
	url := 'http://', (255 atRandom asString), '.',
									(255 atRandom asString), '.',
									(255 atRandom asString), '.',
									(255 atRandom asString), '/'.
]

{ #category : #logging }
RandomRequest >> log: aText [
	Transcript crShow: aText.
]

{ #category : #accessing }
RandomRequest >> timeout [
	^ timeout ifNil: [ timeout := 20 ]
]

{ #category : #accessing }
RandomRequest >> timeout: anObject [
	timeout := anObject
]
