Class {
	#name : #PolarisTest,
	#superclass : #TestCase,
	#category : #'Polaris-Tests'
}

{ #category : #tests }
PolarisTest >> test_create_empty_new_project [

	Polaris newProjectNamed: 'AcArchCraftTestProject'.
	self shouldnt: [ RPackage organizer packageNamed: 'AcArchCraftTestProject' ] raise: KeyNotFound.
	self shouldnt: [ RPackage organizer packageNamed: 'BaselineOfAcArchCraftTestProject' ] raise: KeyNotFound.
	
	
	
	
	
]
