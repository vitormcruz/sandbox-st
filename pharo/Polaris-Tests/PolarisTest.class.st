Class {
	#name : #PolarisTest,
	#superclass : #TestCase,
	#instVars : [
		'#packagesCreatedToClean => InitializedSlot default: an OrderedCollection(\'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\' \'BaselineOfPolarisTestProject\')'
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
PolarisTest >> test_new_empty_project_baseline_method_should_be_created [

	| expectedBaselineName |
	
	Polaris newProjectNamed: 'PolarisTestProject'.
	expectedBaselineName := 'BaselineOf', 'PolarisTestProject'.
	self expectedPackageCreated: expectedBaselineName.
	
	self assert: (expectedBaselineName asClass selectors includes: #baseline:).
	self assert: ((expectedBaselineName asClass compiledMethodAt: #baseline:) protocol) 
		  equals: 'baseline'  	
	
]

{ #category : #tests }
PolarisTest >> test_new_empty_project_baseline_method_should_have_default_value [

	| expectedBaselineName baselineMethodSource |
	
	Polaris newProjectNamed: 'PolarisTestProject'.
	expectedBaselineName := 'BaselineOf', 'PolarisTestProject'.
	self expectedPackageCreated: expectedBaselineName.
	baselineMethodSource := (expectedBaselineName asClass compiledMethodAt: #baseline:) sourceCode.
	
	self assert: (baselineMethodSource copyReplaceAll: ' ' with: '')
		  equals: (('baseline: spec
	<baseline>
        
	spec for: #''common'' do: [
		spec blessing: #''baseline'';     
		
 	   baseline: ''Buoy'' with: [ spec repository: ''github://ba-st/Buoy:v6.1.0/source'' ];
		project: ''Buoy-Tests'' copyFrom: ''Buoy'' with: [ spec loads: #(''Dependent-SUnit-Extensions'') ];
	   baseline: ''LangExtensions'' with: [ spec repository: ''gitlab://vitormcruz/sandbox-st:develop''; 
								 		 loads: #(core) ];
		
 	   baseline: ''Tome'' with: [ spec repository: ''github://vitormcruz/tome:develop/pharo''; loads: #(core) ];
 	   baseline: ''Grease'' with: [ spec repository: ''github://SeasideSt/Grease:v1.9.0/repository''; loads: #(default) ];
	
		baseline:''Seaside3'' with: [ spec repository: ''github://SeasideSt/Seaside:v3.4.7/repository'' ];
		project:''Seaside-Core'' copyFrom: ''Seaside3'' with: [ spec loads: #(''Core'' ''JSON'' ''Email'' ''Javascript'' ''JQuery'' ''JQueryUI'' ''Zinc'' ) ];
		project:''Seaside-Dev'' copyFrom: ''Seaside3'' with: [ spec loads: #(default) ];

		"MaterialDesignLite must be declared after Seaside3 so that the correct version of Grease (1.7.x) is taken, otherwise, version 1.5.0 is taken"
  	   baseline: ''MaterialDesignLite''	with: [ spec repository: ''github://DuneSt/MaterialDesignLite:v2.4.1/src''; loads: #(core) ];	
		baseline: ''ValidationNotification'' with: [ spec repository: ''github://vitormcruz/st_validation_notification:master/pharo''; loads: #(core) ];

		package: ''{1}-Core'';
		package: ''{1}-Adapter'' with: [ spec requires: #(''Seaside-Core'' ''MaterialDesignLite'') ];
		package: ''{1}-Config'' with: [ spec requires: #(''{1}-Core'' ''{1}-Adapter'' ''Grease'') ];
		
		package: ''{1}-Tests'' with: [ spec requires: #(''{1}-Core'' ''Buoy-Tests'') ];
		package: ''{1}-AcceptanceCriteria'' with: [ spec requires: #(''{1}-Core'' ''Buoy-Tests'' ''Tome'' ''{1}-Tests'') ];
		
		group: ''default'' with: #(''dev'');
		group: ''core'' with: #(''{1}-Config'' ''ValidationNotification'');
		group: ''test'' with: #(core ''{1}-Tests'' ''{1}-AcceptanceCriteria'');
		group: ''dev'' with: #(test ''Seaside-Dev'')
	].' format: { 'PolarisTestProject' }) copyReplaceAll: ' ' with: ''). 
	
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
