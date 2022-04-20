Class {
	#name : #DvmDescribedClassForInstrumentation,
	#superclass : #Object,
	#traits : 'TValidationInstrumentation',
	#classTraits : 'TValidationInstrumentation classTrait',
	#instVars : [
		'prop1'
	],
	#category : 'DomainValidationMagritte-Tests-Instrument'
}

{ #category : #'magritte-description' }
DvmDescribedClassForInstrumentation class >> domainDescription [
	<magritteDescription>

	^ MAStringDescription new accessor: #prop1; required: true.
]

{ #category : #'as yet unclassified' }
DvmDescribedClassForInstrumentation class >> validatedNew: aInstanceCreationBlock [

	| validationObserver newInstance |
	
	validationObserver := SimpleValidationObserver new.
	newInstance := aInstanceCreationBlock value.
	validationObserver onValidationSucess: [ ^ newInstance  ] 
							 onValidationError: [ :errors | ^ DvmNullObject newBecauseOfErrors: errors  whileCreatingA: self class ].
	
]

{ #category : #'instance creation' }
DvmDescribedClassForInstrumentation class >> withProp1: prop1 [ 

	^ self validatedNew: [ super new prop1: prop1 ].
]

{ #category : #accessing }
DvmDescribedClassForInstrumentation >> prop1 [

	^ prop1.
]

{ #category : #accessors }
DvmDescribedClassForInstrumentation >> prop1: aProp1 [
	
	prop1 := aProp1.
]
