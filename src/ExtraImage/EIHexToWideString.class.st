Class {
	#name : #EIHexToWideString,
	#superclass : #Object,
	#instVars : [
		'converter',
		'hexString',
		'byteStringStream',
		'wideStringStream'
	],
	#category : #'ExtraImage-Recovery'
}

{ #category : #accessing }
EIHexToWideString >> build [
	byteStringStream := ReadStream on: (EIHexToByteString new hexString: hexString; build).
	[ byteStringStream atEnd ] whileFalse: [ 
		wideStringStream nextPut: (converter nextFromStream: byteStringStream)].
	^ wideStringStream contents.
]

{ #category : #accessing }
EIHexToWideString >> hexString [
	^ hexString
]

{ #category : #accessing }
EIHexToWideString >> hexString: anObject [
	hexString := anObject
]

{ #category : #initialize }
EIHexToWideString >> initialize [
	super initialize.
	converter := UTF8TextConverter new.
	wideStringStream := WriteStream on: ''.
]
