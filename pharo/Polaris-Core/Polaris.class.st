Class {
	#name : #Polaris,
	#superclass : #Object,
	#category : #'Polaris-Core'
}

{ #category : #'project creation' }
Polaris class >> newProjectNamed: aString [ 

	BaselineOf << ('BaselineOf', aString) asSymbol 
		slots: {};
		package: 'BaselineOf', aString
]
