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
