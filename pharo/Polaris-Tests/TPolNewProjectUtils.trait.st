Trait {
	#name : #TPolNewProjectUtils,
	#instVars : [
		'packagesCreatedToClean'
	],
	#category : #'Polaris-Tests'
}

{ #category : #'test util' }
TPolNewProjectUtils >> createProjectForTestNamed: projectNameString [

	Polaris newProjectNamed: projectNameString.
	self expectedPackageCreated: 'BaselineOf' , projectNameString.
	self expectedPackageCreated: projectNameString , '-Config'.
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
	packagesCreatedToClean do: [ :packageName | (RPackage organizer packageNamed: packageName) ifNotNil: #removeFromSystem ].
	packagesCreatedToClean removeAll.
]