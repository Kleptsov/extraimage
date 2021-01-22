Class {
	#name : #EIMasterLightReference,
	#superclass : #Object,
	#category : #'ExtraImage-Core'
}

{ #category : #initialization }
EIMasterLightReference >> initialize [
	| container mc|
	super initialize.
	mc := EIContextInstance value masterContext.
	[mc loadReference: EIUUID storageMonitor]
		on: Error do: [ :ex|
			container := EIContainer new.
			mc selector at: EIUUID storageMonitor put: container.
			mc saveObject: container ]
]

{ #category : #initialization }
EIMasterLightReference >> value [
	| obj |
	obj :=(EIContextInstance value masterContext
		 loadReference: EIUUID storageMonitor) object.
	^ obj.
]

{ #category : #initialization }
EIMasterLightReference >> value: anObject [
	|mc container |
	mc := EIContextInstance value masterContext.
	container := mc loadReference: EIUUID storageMonitor.
	container object: anObject.
	mc saveObject: container.
]
