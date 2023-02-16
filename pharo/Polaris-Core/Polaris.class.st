Class {
	#name : #Polaris,
	#superclass : #Object,
	#category : #'Polaris-Core'
}

{ #category : #'project creation' }
Polaris class >> newProjectNamed: aString [

	| baselineName |
	
	baselineName := 'BaselineOf' , aString.

	(BaselineOf << baselineName asSymbol)
		slots: {  };
		package: baselineName; install.
]
