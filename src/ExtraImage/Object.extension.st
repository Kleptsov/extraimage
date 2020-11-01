Extension { #name : #Object }

{ #category : #'*ExtraImage' }
Object >> eiHash [
	^ self hash.
]

{ #category : #'*ExtraImage' }
Object >> isExternal [
	^ false
]

{ #category : #'*ExtraImage' }
Object >> mayBeReference [
	^ true
]

{ #category : #'*ExtraImage' }
Object class >> newObject: size [
	size = 0 ifTrue: [ ^ self new ].
	^ self new: size.
]
