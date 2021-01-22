Class {
	#name : #EIContextInstance,
	#superclass : #ProcessLocalVariable,
	#category : #'ExtraImage-Config'
}

{ #category : #accessing }
EIContextInstance class >> value [
	^ super value ifNil: [ |ctx|
		ctx := EIContextBuilder build.
		self value: ctx.
		ctx ]
]
