"
Конвертирует из шестнадцатиричной кодировки сначала в UTF8 и далее в WideString.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	converter:		<Object>


    Implementation Points
"
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
