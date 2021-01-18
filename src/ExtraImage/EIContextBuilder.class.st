"
Собиратель контекста

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #EIContextBuilder,
	#superclass : #Object,
	#category : #'ExtraImage-Config'
}

{ #category : #building }
EIContextBuilder class >> build [
	|ctx|
	ctx := EIContext new.
	ctx selector: EISelectorInstance value.
	ctx storage: EIStorage2 new.
	^ ctx
]
