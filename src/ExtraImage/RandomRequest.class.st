"
Запрос на случайный адрес, если успешно записывается в базу

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	request:		<Object>
	response:		<Object>
	timeout:		<Object>
	url:		<Object>


    Implementation Points
"
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
