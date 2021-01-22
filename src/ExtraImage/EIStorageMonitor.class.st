Class {
	#name : #EIStorageMonitor,
	#superclass : #EIMonitor,
	#category : #'ExtraImage-Core'
}

{ #category : #initialization }
EIStorageMonitor >> initializePrivate [
	monitor := EIMasterLightReference new.
]
