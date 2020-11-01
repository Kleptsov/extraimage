"
Общий суперкласс для коллекций ExtraImage

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #EICollection,
	#superclass : #Object,
	#category : #'ExtraImage-Collection'
}

{ #category : #testing }
EICollection >> isExternal [
	^ true
]
