Extension { #name : #ByteArray }

{ #category : #'*ExtraImage' }
ByteArray >> hash2 [
	^ Integer byte1: (self at: 1) byte2: (self at: 2) byte3: (self at: 3) byte4: ((self at: 4) bitAnd: 16r3f)
]

{ #category : #'*ExtraImage' }
ByteArray >> hash20 [
	^ Integer byte1: (self at: 1) byte2: (self at: 2) byte3: ((self at: 3) bitAnd: 2r1111) byte4: 0 
]
