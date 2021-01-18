Extension { #name : #Fraction }

{ #category : #'*ExtraImage' }
Fraction >> eiString [
	| ws |
	ws := WriteStream on: ''.
	ws nextPutAll: numerator asString.
	ws nextPut: $/.
	ws nextPutAll: denominator asString.
	^ ws contents.
]
