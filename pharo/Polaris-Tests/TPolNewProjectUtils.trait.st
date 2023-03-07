Trait {
	#name : #TPolNewProjectUtils,
	#instVars : [
		'packagesCreatedToClean'
	],
	#category : #'Polaris-Tests'
}

{ #category : #'test util' }
TPolNewProjectUtils >> createProjectForTestNamed: projectNameString [

	self expectedPackageCreated: 'BaselineOf' , projectNameString.
	self expectedPackageCreated: projectNameString , '-Core'.
	self expectedPackageCreated: projectNameString , '-Adapter-Seaside'.
	self expectedPackageCreated: projectNameString , '-Config'.
	self expectedPackageCreated: projectNameString , '-Tests'.
	self expectedPackageCreated: projectNameString , '-AcceptanceCriteria'.
	
	
	Polaris newProjectNamed: projectNameString.
]

{ #category : #'test util' }
TPolNewProjectUtils >> expectedPackageCreated: aPackageName [

	packagesCreatedToClean add: aPackageName


]

{ #category : #initialization }
TPolNewProjectUtils >> initialize [
	
	super initialize.
	packagesCreatedToClean := OrderedCollection new.
]

{ #category : #running }
TPolNewProjectUtils >> tearDown [ 

	super tearDown.
	packagesCreatedToClean do: [ :packageName | RPackage organizer packageNamed: packageName ifPresent: #removeFromSystem ].
	packagesCreatedToClean removeAll.
]
