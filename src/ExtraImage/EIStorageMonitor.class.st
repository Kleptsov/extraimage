"
Монитор хранилища, управляет доступом к хранилищу нескольких клиентов. Клиенты могут распологаться на разных образах.  Используется только один экземпляр

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #EIStorageMonitor,
	#superclass : #EIMonitor,
	#category : #'ExtraImage-Core'
}

{ #category : #initialization }
EIStorageMonitor >> initializePrivate [
	monitor := EIMasterLightReference new.
]
