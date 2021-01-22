Class {
	#name : #EILightReference,
	#superclass : #Object,
	#instVars : [
		'reference'
	],
	#category : #'ExtraImage-Core'
}

{ #category : #accessing }
EILightReference >> initialize [
	|key container|
	container := EIContainer new.
	key := EIContextInstance value selector keyAtValue: container.
	reference := key asString.
	EIContextInstance value
		saveObject: container;
		saveObject: self.
]

{ #category : #accessing }
EILightReference >> value [
	|obj ref|
	"ref := EIUUID fromString: reference."
	obj :=(EIContextInstance value loadReference: reference) object.
	^ obj.
]

{ #category : #accessing }
EILightReference >> value: anObject [
	|ref container|
	"ref := EIUUID fromString: reference."
	container := EIContextInstance value loadReference: reference.
	container object: anObject.
	EIContextInstance value
		saveObject: container.
]
