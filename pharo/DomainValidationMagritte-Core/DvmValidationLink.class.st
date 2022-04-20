Class {
	#name : #DvmValidationLink,
	#superclass : #Object,
	#instVars : [
		'magritteDescription',
		'validations'
	],
	#category : 'DomainValidationMagritte-Core'
}

{ #category : #'instance creation' }
DvmValidationLink class >> forDescription: aMagritteDescription [

	^ super new magritteDescription: aMagritteDescription.
]

{ #category : #accessing }
DvmValidationLink >> magritteDescription [
	^ magritteDescription
]

{ #category : #accessing }
DvmValidationLink >> magritteDescription: anObject [
	magritteDescription := anObject.
	validations := magritteDescription asValidations.
]

{ #category : #'link api' }
DvmValidationLink >> validateOperation: operation ofObject: instrumentedObject sentWith: parameters andRunningWithingContext: context [
	""

	| validationObserver |
	validationObserver := SimpleValidationObserver new.
	
	validations do: [: validation | 
		validation validateFor: instrumentedObject 
		 		     withParamsProvided: parameters
		           fromContext: context
	].
		
	validationObserver isValidationSuccessful ifTrue: [ ^ operation value ].
	^ instrumentedObject
]
