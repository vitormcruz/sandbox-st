Trait {
	#name : #TValidationInstrumentation,
	#category : 'DomainValidationMagritte-Core'
}

{ #category : #'class initialization' }
TValidationInstrumentation classSide >> initialize [ 

	self linkDomainValidations.
]

{ #category : #'as yet unclassified' }
TValidationInstrumentation classSide >> validatedNew: aInstanceCreationBlock [

	| validationObserver newInstance |
	
	validationObserver := SimpleValidationObserver new.
	newInstance := aInstanceCreationBlock value.
	validationObserver isValidationSuccessful ifTrue: [ ^ newInstance  ] ifFalse: [ ^ DvmNullObject new ].
	
]
