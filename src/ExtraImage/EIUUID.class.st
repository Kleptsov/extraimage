Class {
	#name : #EIUUID,
	#superclass : #UUID,
	#type : #bytes,
	#classInstVars : [
		'hexMap',
		'hexCharMap'
	],
	#category : #'ExtraImage-Core'
}

{ #category : #accessing }
EIUUID class >> byteHex1: aHex1 byteHex2: aHex2 [
	^ (hexMap at: (hexCharMap at: aHex1) + 1) at: (hexCharMap at: aHex2) +1.
]

{ #category : #initialize }
EIUUID class >> emptyEIUUID [
	|inst|
	inst := self nilUUID.
	1 to: 16 do: [:index| inst at: index put: 0 ].
	^ inst.
]

{ #category : #accessing }
EIUUID class >> from: aStringOrUUID [
	| u |
	aStringOrUUID class = EIUUID ifTrue: [ ^ aStringOrUUID ].
	aStringOrUUID class = UUID ifTrue: [ u := self new. 1 to: 16 do: [ :index| u at: index put: (aStringOrUUID at: index) ]. ^ u ].
	aStringOrUUID class = ByteArray ifTrue: [ ^ self fromString: aStringOrUUID asString ].
	aStringOrUUID class = ByteString ifTrue: [ ^ self fromString: aStringOrUUID ]
]

{ #category : #accessing }
EIUUID class >> fromByteArray: aByteArray [
	|uuid|
	uuid := self nilUUID.
	1 to: 16 do: [ :index|
		uuid at: index put: (aByteArray at: index) ].
	^ uuid
]

{ #category : #accessing }
EIUUID class >> fromString: aString [
	| uuid |
	self hexCharMap; hexMap.
	uuid := self nilUUID.
	uuid at: 1 put: (self byteHex1: (aString byteAt: 1) byteHex2: (aString byteAt: 2)).
	uuid at: 2 put: (self byteHex1: (aString byteAt: 3) byteHex2: (aString byteAt: 4)).
	uuid at: 3 put: (self byteHex1: (aString byteAt: 5) byteHex2: (aString byteAt: 6)).
	uuid at: 4 put: (self byteHex1: (aString byteAt: 7) byteHex2: (aString byteAt: 8)).
	uuid at: 5 put: (self byteHex1: (aString byteAt: 10) byteHex2: (aString byteAt: 11)).
	uuid at: 6 put: (self byteHex1: (aString byteAt: 12) byteHex2: (aString byteAt: 13)).
	uuid at: 7 put: (self byteHex1: (aString byteAt: 15) byteHex2: (aString byteAt: 16)).
	uuid at: 8 put: (self byteHex1: (aString byteAt: 17) byteHex2: (aString byteAt: 18)).
	uuid at: 9 put: (self byteHex1: (aString byteAt: 20) byteHex2: (aString byteAt: 21)).
	uuid at: 10 put: (self byteHex1: (aString byteAt: 22) byteHex2: (aString byteAt: 23)).
	uuid at: 11 put: (self byteHex1: (aString byteAt: 25) byteHex2: (aString byteAt: 26)).
	uuid at: 12 put: (self byteHex1: (aString byteAt: 27) byteHex2: (aString byteAt: 28)).
	uuid at: 13 put: (self byteHex1: (aString byteAt: 29) byteHex2: (aString byteAt: 30)).
	uuid at: 14 put: (self byteHex1: (aString byteAt: 31) byteHex2: (aString byteAt: 32)).
	uuid at: 15 put: (self byteHex1: (aString byteAt: 33) byteHex2: (aString byteAt: 34)).
	uuid at: 16 put: (self byteHex1: (aString byteAt: 35) byteHex2: (aString byteAt: 36)).
	^ uuid.
]

{ #category : #accessing }
EIUUID class >> hexCharMap [
	hexCharMap ifNil: [ hexCharMap := Array new: 256.
		hexCharMap at: 48 put: 0;
						at: 49 put: 1;
						at: 50 put: 2;
						at: 51 put: 3;
						at: 52 put: 4;
						at: 53 put: 5;
						at: 54 put: 6;
						at: 55 put: 7;
						at: 56 put: 8;
						at: 57 put: 9;
						at: 65 put: 10;
						at: 66 put: 11;
						at: 67 put: 12;
						at: 68 put: 13;
						at: 69 put: 14;
						at: 70 put: 15;
						at: 97 put: 10;
						at: 98 put: 11;
						at: 99 put: 12;
						at: 100 put: 13;
						at: 101 put: 14;
						at: 102 put: 15 ].
]

{ #category : #accessing }
EIUUID class >> hexMap [
	hexMap ifNil: [ hexMap := {  
		{0. 1. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11. 12. 13. 14. 15 }.
		{ 16r10. 16r11. 16r12. 16r13. 16r14. 16r15. 16r16. 16r17. 16r18. 16r19. 16r1A. 16r1B. 16r1C. 16r1D. 16r1E. 16r1F }. 
		{ 16r20. 16r21. 16r22. 16r23. 16r24. 16r25. 16r26. 16r27. 16r28. 16r29. 16r2A. 16r2B. 16r2C. 16r2D. 16r2E. 16r2F }. 
		{ 16r30. 16r31. 16r32. 16r33. 16r34. 16r35. 16r36. 16r37. 16r38. 16r39. 16r3A. 16r3B. 16r3C. 16r3D. 16r3E. 16r3F }. 
		#( 16r40 16r41 16r42 16r43 16r44 16r45 16r46 16r47 16r48 16r49 16r4A 16r4B 16r4C 16r4D 16r4E 16r4F ).
		{ 16r50. 16r51. 16r52. 16r53. 16r54. 16r55. 16r56. 16r57. 16r58. 16r59. 16r5A. 16r5B. 16r5C. 16r5D. 16r5E. 16r5F }.
		{ 16r60. 16r61. 16r62. 16r63. 16r64. 16r65. 16r66. 16r67. 16r68. 16r69. 16r6A. 16r6B. 16r6C. 16r6D. 16r6E. 16r6F }. 
		{ 16r70. 16r71. 16r72. 16r73. 16r74. 16r75. 16r76. 16r77. 16r78. 16r79. 16r7A. 16r7B. 16r7C. 16r7D. 16r7E. 16r7F }.
		{ 16r80. 16r81. 16r82. 16r83. 16r84. 16r85. 16r86. 16r87. 16r88. 16r89. 16r8A. 16r8B. 16r8C. 16r8D. 16r8E. 16r8F }.
		{ 16r90. 16r91. 16r92. 16r93. 16r94. 16r95. 16r96. 16r97. 16r98. 16r99. 16r9A. 16r9B. 16r9C. 16r9D. 16r9E. 16r9F }.
		{ 16rA0. 16rA1. 16rA2. 16rA3. 16rA4. 16rA5. 16rA6. 16rA7. 16rA8. 16rA9. 16rAA. 16rAB. 16rAC. 16rAD. 16rAE. 16rAF }.
		{ 16rB0. 16rB1. 16rB2. 16rB3. 16rB4. 16rB5. 16rB6. 16rB7. 16rB8. 16rB9. 16rBA. 16rBB. 16rBC. 16rBD. 16rBE. 16rBF }.
		{ 16rC0. 16rC1. 16rC2. 16rC3. 16rC4. 16rC5. 16rC6. 16rC7. 16rC8. 16rC9. 16rCA. 16rCB. 16rCC. 16rCD. 16rCE. 16rCF }.
		{ 16rD0. 16rD1. 16rD2. 16rD3. 16rD4. 16rD5. 16rD6. 16rD7. 16rD8. 16rD9. 16rDA. 16rDB. 16rDC. 16rDD. 16rDE. 16rDF }.
		{ 16rE0. 16rE1. 16rE2. 16rE3. 16rE4. 16rE5. 16rE6. 16rE7. 16rE8. 16rE9. 16rEA. 16rEB. 16rEC. 16rED. 16rEE. 16rEF }.
		{ 16rF0. 16rF1. 16rF2. 16rF3. 16rF4. 16rF5. 16rF6. 16rF7. 16rF8. 16rF9. 16rFA. 16rFB. 16rFC. 16rFD. 16rFE. 16rFF }. 
	}  ].
]

{ #category : #'instance creation' }
EIUUID class >> new: aSize [

	^ (self basicNew: aSize) initialize  
]

{ #category : #initialize }
EIUUID class >> reset [
	hexCharMap := nil.
	hexMap := nil.
]

{ #category : #initialize }
EIUUID class >> rootSelector [
	|inst|
	inst := self emptyEIUUID.
	inst at: 16 put: 1.
	^ inst
]

{ #category : #initialize }
EIUUID class >> storageMonitor [
	|inst|
	inst := self emptyEIUUID.
	inst at: 16 put: 2.
	^ inst
]

{ #category : #comparing }
EIUUID >> = anObject [
	|cl|
	cl := anObject class.
	(cl = EIUUID or: [ cl = UUID ]) ifTrue: [ 
		1 to: 16 do: [ :index|
			(self at: index) = (anObject at: index)  ifFalse: [ ^ false ] ].
		^ true ]
	ifFalse: [ ^ false ]
]

{ #category : #creating }
EIUUID >> fromString: aString [
	^ self fromString: aString
]

{ #category : #comparing }
EIUUID >> hash [
	^ Integer byte1: (self at: 1) byte2: (self at: 2) byte3: (self at: 3) byte4: ((self at: 4) bitAnd: 16r3f)
]

{ #category : #comparing }
EIUUID >> isEmpty [
	|sum|
	sum := 0.
	1 to: self size do: [ :index| sum := sum + (self at: index) ].
	^ sum = 0.
]
