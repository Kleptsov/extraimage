"
Конвертер WideString в UTF8 и далее в шестнадцатиричную кодировку

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #EIWideStringToHex,
	#superclass : #Object,
	#instVars : [
		'converter',
		'wideString',
		'utf8',
		'hex'
	],
	#category : #'ExtraImage-JsonBuilder'
}

{ #category : #building }
EIWideStringToHex >> build [
	wideString do: [ :c|
		converter nextPut: c toStream: utf8 ].
	hex := EIByteStringToHex new string: utf8 contents; build.
	^ hex.
	
]

{ #category : #initialize }
EIWideStringToHex >> initialize [
	super initialize.
	converter := UTF8TextConverter new.
	utf8 := WriteStream on: ''
]

{ #category : #accessing }
EIWideStringToHex >> wideString [
	^ wideString
]

{ #category : #accessing }
EIWideStringToHex >> wideString: anObject [
	wideString := anObject
]
