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
