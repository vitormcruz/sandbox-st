"
I am used to test the generated validations, specifically. Ie., It tests DvmGeneratedValidation instances.
"
Class {
	#name : #DvmValidationGeneratedTest,
	#superclass : #TestCase,
	#instVars : [
		'validationObserver',
		'fakeObjectValidated',
		'fakeContext'
	],
	#category : 'DomainValidationMagritte-Tests-Validations'
}

{ #category : #'test support' }
DvmValidationGeneratedTest >> expectedErrorForValidation: errorString andParameter: aSymbol [

	^ { { fakeObjectValidated class name, '.', fakeContext methodSelector, '.', aSymbol, '.', errorString. fakeObjectValidated. fakeContext } }.
]

{ #category : #running }
DvmValidationGeneratedTest >> setUp [

	super setUp.
	validationObserver := TestObserver new.
	fakeObjectValidated := Object new.
	fakeContext := Mock new.
	fakeContext stub methodSelector willReturn: #fakeSelector.
]

{ #category : #tests }
DvmValidationGeneratedTest >> test_generated_validation_failure [

	self using: (#required -> true asValidationForParam: #param1 indexedAt: 1) 
		  validate: nil
		  andExpect: (self expectedErrorForValidation: 'required' andParameter: 'param1').		
		

]

{ #category : #tests }
DvmValidationGeneratedTest >> test_generated_validation_success [

	self using: (#required -> false asValidationForParam: #param1 indexedAt: 1) 
		  validateExpectingSucess: nil.
		
	self using: (#required -> false asValidationForParam: #param1 indexedAt: 1) 
		  validateExpectingSucess: 1.		

]

{ #category : #tests }
DvmValidationGeneratedTest >> using: aGeneratedValidation validate: anObjectToValidate andExpect: anErrorStruture [

	validationObserver reset.
	aGeneratedValidation validateFor: fakeObjectValidated
								withParamsProvided: {anObjectToValidate}
								fromContext: fakeContext.
								
	self assertCollection: validationObserver errorArray asSet
		  hasSameElements: anErrorStruture
]

{ #category : #tests }
DvmValidationGeneratedTest >> using: aGeneratedValidation validateExpectingSucess: anObjectToValidate [

	validationObserver reset.
	
	aGeneratedValidation validateFor: fakeObjectValidated
					 		   withParamsProvided: {anObjectToValidate}
		                  fromContext: fakeContext.
		
	self assert: validationObserver isValidationSuccessful
]
