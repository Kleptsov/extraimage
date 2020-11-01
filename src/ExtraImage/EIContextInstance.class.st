"
Переменная процесса, содержит текущий контекст

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
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
