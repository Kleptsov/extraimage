Class {
	#name : #EIUUIDTest,
	#superclass : #TestCase,
	#category : #'ExtraImage-Tests'
}

{ #category : #test }
EIUUIDTest >> testFromString [
	|u1 strU1 u2 |
	u1 := UUID new.
	strU1 := u1 asString.
	u2 := EIUUID fromString: strU1.
	1 to: 16 do: [ :index|
		self assert: (u1 at: 1) = (u2 at: 1) ]
]
