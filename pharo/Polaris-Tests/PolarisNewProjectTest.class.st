Class {
	#name : #PolarisNewProjectTest,
	#superclass : #TestCase,
	#traits : 'TPolNewProjectUtils',
	#classTraits : 'TPolNewProjectUtils classTrait',
	#instVars : [
		'packagesCreatedToClean'
	],
	#category : #'Polaris-Tests'
}

{ #category : #tests }
PolarisNewProjectTest >> test_new_project_baseline_should_load_correctly [

	self skip.

	Polaris newProjectNamed: 'PolarisTestProject'.
	"TODO: implement test that loads the projects created and asserts. (Unload??)"
	
	
	
	
	
]
