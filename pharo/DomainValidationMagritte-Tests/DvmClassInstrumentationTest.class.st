"
I am used to test the actual instrumentation of a described class with the according validations.
"
Class {
	#name : #DvmClassInstrumentationTest,
	#superclass : #TestCase,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#instVars : [
		'validationObserver'
	],
	#category : 'DomainValidationMagritte-Tests-Instrument'
}

{ #category : #running }
DvmClassInstrumentationTest >> setUp [
										
	validationObserver := TestObserver new.
	
	DvmDescribedClassForInstrumentation chain selectors;
										  collect: [ :s | (DvmDescribedClassForInstrumentation >> s) ast links ]; 
										  flattened;
										  select: #notNil;
										  do: #uninstall.
										
	DvmDescribedClassForInstrumentation initialize.
]

{ #category : #tests }
DvmClassInstrumentationTest >> testInstantiatingInvalidObject [

	self assertBlock: [ (DvmDescribedClassForInstrumentation withProp1: nil) 
		  isKindOf: DvmNullObject].
]

{ #category : #tests }
DvmClassInstrumentationTest >> testInstantiatingValidObject [

	self assertBlock: [ (DvmDescribedClassForInstrumentation withProp1: 'valid') prop1 = 'valid'].
]

{ #category : #tests }
DvmClassInstrumentationTest >> testRemoveInstrumentationOnlyOfDescriptions [
]

{ #category : #tests }
DvmClassInstrumentationTest >> testerrorsExpectedGot [
]
