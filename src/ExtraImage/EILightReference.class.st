"
позволяет сохранять и загружать объекты использую легкую ссылку, т.е. при загрузке экземпляра EILightReference  хранимый объект не загружается в память.
Загрузка и сохранение выполняется либо через сообщения value, value: или объект сохраняется отдельно 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	reference:		<Object>


    Implementation Points
"
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
