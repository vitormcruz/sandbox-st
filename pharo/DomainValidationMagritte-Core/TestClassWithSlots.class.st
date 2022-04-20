Class {
	#name : #TestClassWithSlots,
	#superclass : #Object,
	#instVars : [
		'#tests => BooleanSlot',
		'#tests2 => BooleanSlot',
		'#tests3 => BooleanSlot'
	],
	#category : 'DomainValidationMagritte-Core'
}

{ #category : #initialization }
TestClassWithSlots >> initialize [
	super initialize.
	self class initializeSlots: self.
]
