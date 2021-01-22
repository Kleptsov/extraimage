Class {
	#name : #EIMonitor,
	#superclass : #Object,
	#instVars : [
		'monitor'
	],
	#category : #'ExtraImage-Core'
}

{ #category : #control }
EIMonitor >> enter [
	[self waitForNil.
	self isCompetition ] whileTrue
]

{ #category : #control }
EIMonitor >> exit [
	monitor value: nil.
]

{ #category : #initialization }
EIMonitor >> initialize [
	super initialize.
	self initializePrivate.
]

{ #category : #initialization }
EIMonitor >> initializePrivate [
	monitor := EILightReference new
						value: nil.
]

{ #category : #control }
EIMonitor >> isCompetition [
	| temp |
	temp := 10000000 atRandom.
	monitor value: temp.
	^ monitor value ~= temp
]

{ #category : #control }
EIMonitor >> waitForNil [
	"Ожидаение пока не освободиться монитор.
	Если в течении минуты монитор еще занят, происходит принудительная разблокировка"
	| count isAccess monitorValue |
	count := 0.
	isAccess := false.
	monitorValue := nil.
	[
		monitor value
			ifNil: [ isAccess := true ]
			ifNotNil: [ :v |
							v ~= monitorValue ifTrue: [ count := 0 ].
							monitorValue := v.
							(Delay forMilliseconds: 100) wait.
							isAccess := false ].
		count := count + 1.
		count > 600 ifTrue: [ isAccess := true ]. "требуетя добавить извещение о разблокировки монитора"
		isAccess yourself.
	] whileFalse.
]
