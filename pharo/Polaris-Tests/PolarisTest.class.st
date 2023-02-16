Class {
	#name : #PolarisTest,
	#superclass : #TestCase,
	#instVars : [
		'#packagesCreatedToClean => InitializedSlot default: an OrderedCollection(\'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\')'
	],
	#category : #'Polaris-Tests'
}

{ #category : #cleanup }
PolarisTest >> expectedPackageCreated: aPackageName [

	packagesCreatedToClean add: aPackageName


]

{ #category : #initialization }
PolarisTest >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #running }
PolarisTest >> tearDown [ 

	packagesCreatedToClean do: [ :packageName |(RPackage organizer packageNamed: packageName ifAbsent: [ ^ self ]) removeFromSystem ]
]

{ #category : #tests }
PolarisTest >> test_new_empty_project_baseline_should_be_created [

	| expectedBaselineName |
	
	Polaris newProjectNamed: 'PolarisTestProject'.
	expectedBaselineName := 'BaselineOf', 'PolarisTestProject'.
	self expectedPackageCreated: expectedBaselineName.
	
	self assert: (RPackage organizer includesPackageNamed: expectedBaselineName) 
		  description: 'Should create a package named: ', expectedBaselineName.
		
	self shouldnt: [ expectedBaselineName asClass ] raise: NotFound.
	
	self assert: ((RPackage organizer packageNamed: expectedBaselineName) definedClasses includes: #BaselineOfPolarisTestProject asClass) 
		  description: 'Baseline class should be created inside the correct package'.	
	
	
]

{ #category : #tests }
PolarisTest >> test_new_empty_project_repository_should_be_created [

	self skip.

	Polaris newProjectNamed: 'PolarisTestProject'.
	self expectedPackageCreated: 'BaselineOfPolarisTestProject'.
	self assert: ((IceRepository repositories collect: #name) includes: 'PolarisTestProject') description: 'A repository should be created, but wasn''t'
	
	
	
	
	
]
