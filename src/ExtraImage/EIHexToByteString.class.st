"
Конвертирует шестнадцатиричное представление в ByteString

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

пример EIHexToByteString new hexString: '616263'; build. <'abc'>
 
Internal Representation and Key Implementation Points.

    Instance Variables
	hexString:		<Object>
	res:		<Object>


    Implementation Points
"
Class {
	#name : #EIHexToByteString,
	#superclass : #Object,
	#instVars : [
		'hexString',
		'res'
	],
	#classInstVars : [
		'map'
	],
	#category : #'ExtraImage-Recovery'
}

{ #category : #accessing }
EIHexToByteString class >> map [
	^ map ifNil: [ map := { 
			$0->0. $1->1. $2->2. $3->3. $4->4. $5->5. $6->6. $7->7. $8->8. $9->9. $A->10. $B->11. $C->12. $D->13. $E->14. $F->15.
		 } asDictionary ]
]

{ #category : #building }
EIHexToByteString >> build [
	| one two codePoint|
	res := WriteStream on: ''.
	1 to: hexString size by: 2 do: [ :index|
		one := hexString at: index.
		two := hexString at: index + 1.
		codePoint := (self class map at: one) bitShift: 4.
		codePoint := codePoint + (self class map at: two).
		res nextPut: (Character codePoint: codePoint) ].
	^ res := res contents.
]

{ #category : #accessing }
EIHexToByteString >> hexString [
	^ hexString
]

{ #category : #accessing }
EIHexToByteString >> hexString: anObject [
	hexString := anObject
]

{ #category : #accessing }
EIHexToByteString >> res [
	^ res
]

{ #category : #accessing }
EIHexToByteString >> res: anObject [
	res := anObject
]
