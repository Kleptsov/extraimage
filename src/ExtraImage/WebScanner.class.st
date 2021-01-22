Class {
	#name : #WebScanner,
	#superclass : #Object,
	#instVars : [
		'count',
		'block',
		'processes',
		'hz',
		'timeout'
	],
	#category : #'ExtraImage-Tmp-WebScanner'
}

{ #category : #accessing }
WebScanner >> count [
	^ (timeout * hz) asInteger.
]

{ #category : #accessing }
WebScanner >> hz [
	^ hz
]

{ #category : #accessing }
WebScanner >> hz: anObject [
	hz := anObject
]

{ #category : #initialize }
WebScanner >> initialize [
	super initialize.
	hz := 1.
	timeout := 20.
]

{ #category : #accessing }
WebScanner >> processes [
	^ processes ifNil: [ processes := OrderedCollection new ].
]

{ #category : #accessing }
WebScanner >> processes: anObject [
	processes := anObject
]

{ #category : #actions }
WebScanner >> removeAll [
	self stop.
	self processes: OrderedCollection new.
]

{ #category : #actions }
WebScanner >> start [
	self removeAll.
	self count timesRepeat: [ 
		self processes add: ([ 
				[
					RandomRequest new timeout: timeout; get.
					true.
				] whileTrue
			 ] fork) ]
	
]

{ #category : #actions }
WebScanner >> stop [
	self processes do: [ :pr|
		pr terminate ].
]

{ #category : #accessing }
WebScanner >> timeout [
	^ timeout
]

{ #category : #accessing }
WebScanner >> timeout: anObject [
	timeout := anObject
]
