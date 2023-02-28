Class {
	#name : #PolPolarisNewProjectTest,
	#superclass : #TestCase,
	#traits : 'TPolNewProjectUtils',
	#classTraits : 'TPolNewProjectUtils classTrait',
	#instVars : [
		'packagesCreatedToClean'
	],
	#category : #'Polaris-Tests'
}

{ #category : #tests }
PolPolarisNewProjectTest >> test_new_project_app_class_should_be_created [


	self createProjectForTestNamed: 'PolarisTestProject'.
	
	self shouldnt: [ 'PolarisTestProjectMain' asClass ] raise: NotFound.
	
	self assert: 'PolarisTestProjectMain' asClass superclass equals:  CommandLineHandler.
	
	self assert: ((RPackage organizer packageNamed: 'PolarisTestProject-Config') definedClasses includes: #PolarisTestProjectMain asClass) 
		  description: 'App class should be created inside the correct package'.
	
	
]

{ #category : #tests }
PolPolarisNewProjectTest >> test_new_project_app_class_should_have_activate_method [

	| createdClass |
	
	self createProjectForTestNamed: 'PolarisTestProject'.
	createdClass := 'PolarisTestProjectMain' asClass.
	
	self assert: (createdClass selectors includes: #activate).

	self assert: ((createdClass compiledMethodAt: #activate) sourceCode copyReplaceAll: ' ' with: '')
		  equals: (('activate
	| adaptor |
	
	adaptor := ZnZincServerAdaptor new. "Self registered..."
	
	adaptor port: (Smalltalk os environment at: #PORT ifAbsent: 8080) asInteger.
	WAAdmin defaultServerManager startAll.
	WAAdmin defaultDispatcher defaultName: ''PolarisTestProject''.

	Smalltalk snapshot: false andQuit: false') copyReplaceAll: ' ' with: '' ).
]

{ #category : #tests }
PolPolarisNewProjectTest >> test_new_project_baseline_method_should_be_created [

	self createProjectForTestNamed: 'PolarisTestProject'.
	self assert: ('BaselineOfPolarisTestProject' asClass selectors includes: #baseline:).
	self assert: ('BaselineOfPolarisTestProject' asClass compiledMethodAt: #baseline:) protocol
        equals: 'baseline'
]

{ #category : #tests }
PolPolarisNewProjectTest >> test_new_project_baseline_method_should_have_default_value [

	| baselineMethodSource |
	
	self createProjectForTestNamed: 'PolarisTestProject'.
	baselineMethodSource := ('BaselineOfPolarisTestProject' asClass compiledMethodAt: #baseline:) sourceCode.
	
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

		package: ''PolarisTestProject-Core'';
		package: ''PolarisTestProject-Adapter'' with: [ spec requires: #(''Seaside-Core'' ''MaterialDesignLite'') ];
		package: ''PolarisTestProject-Config'' with: [ spec requires: #(''PolarisTestProject-Core'' ''PolarisTestProject-Adapter'' ''Grease'') ];
		
		package: ''PolarisTestProject-Tests'' with: [ spec requires: #(''PolarisTestProject-Core'' ''Buoy-Tests'') ];
		package: ''PolarisTestProject-AcceptanceCriteria'' with: [ spec requires: #(''PolarisTestProject-Core'' ''Buoy-Tests'' ''Tome'' ''PolarisTestProject-Tests'') ];
		
		group: ''default'' with: #(''dev'');
		group: ''core'' with: #(''PolarisTestProject-Config'' ''ValidationNotification'');
		group: ''test'' with: #(core ''PolarisTestProject-Tests'' ''PolarisTestProject-AcceptanceCriteria'');
		group: ''dev'' with: #(test ''Seaside-Dev'')
	].') copyReplaceAll: ' ' with: ''). 
	
]

{ #category : #tests }
PolPolarisNewProjectTest >> test_new_project_baseline_should_be_created [


	self createProjectForTestNamed: 'PolarisTestProject'.
	
	self assert: (RPackage organizer includesPackageNamed: 'BaselineOfPolarisTestProject') 
		  description: 'Should create a package named: ', 'BaselineOfPolarisTestProject'.
		
	self shouldnt: [ 'BaselineOfPolarisTestProject' asClass ] raise: NotFound.
	
	self assert: ((RPackage organizer packageNamed: 'BaselineOfPolarisTestProject') definedClasses includes: #BaselineOfPolarisTestProject asClass) 
		  description: 'Baseline class should be created inside the correct package'.	
	
	
]

{ #category : #tests }
PolPolarisNewProjectTest >> test_new_project_repository_should_be_created [

	self skip.

	Polaris newProjectNamed: 'PolarisTestProject'.
	self expectedPackageCreated: 'BaselineOfPolarisTestProject'.
	self assert: ((IceRepository repositories collect: #name) includes: 'PolarisTestProject') description: 'A repository should be created, but wasn''t'
	
	
	
	
	
]
