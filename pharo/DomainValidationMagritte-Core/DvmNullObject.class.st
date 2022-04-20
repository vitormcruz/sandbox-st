Class {
	#name : #DvmNullObject,
	#superclass : #Object,
	#traits : 'TValidationInstrumentation',
	#classTraits : 'TValidationInstrumentation classTrait @ {#initializeValidationInstrumentation->#initialize}',
	#instVars : [
		'errors',
		'derivedClass'
	],
	#classInstVars : [
		'errorKeyMap'
	],
	#category : 'DomainValidationMagritte-Core'
}

{ #category : #'magritte-description' }
DvmNullObject class >> domainDescription [ 
	<magritteDescription>
	
	^ {
	   MAClassDescription new accessor: #derivedClass; required: true. 
	   MAMagnitudeDescription new accessor: #errors; empty: false.
	  }.

]

{ #category : #'as yet unclassified' }
DvmNullObject class >> extractErrorMessagesFrom: errors [

	^ errors collect: [ :error | errorKeyMap at: error errorMessage ].
]

{ #category : #'class initialization' }
DvmNullObject class >> initialize [ 

	self initializeValidationInstrumentation.
	errorKeyMap := { 'DvmNullObject.derivedClass:.derivedClass.required' -> 
                    'Null objects should be a representation of a Class whose creation has failed, but you do not provided this information.'. 

						  'DvmNullObject.errors:.errors.empty' -> 
                     'Null objects should be created with at least one underlined error, but none was provided.'. 
												
						} asDictionary.

]

{ #category : #'instance creation' }
DvmNullObject class >> new [

	Error signal: 'A NullObject should be created with one of it''s custom instance creation methods.'.
]

{ #category : #'instance creation' }
DvmNullObject class >> newBecauseOfErrors: aCollection whileCreatingA: aClass [ 
	
	^ SimpleValidationObserver new execute: [ super new errors: aCollection; derivedClass: aClass.	]
 		 							      onValidationError: [:errors | 
												Error signal: (Character cr join: (self extractErrorMessagesFrom: errors))
											].
]

{ #category : #'as yet unclassified' }
DvmNullObject class >> validatedNew: aInstanceCreationBlock [

	| validationObserver newInstance |
	
	validationObserver := SimpleValidationObserver new.
	newInstance := aInstanceCreationBlock value.
	validationObserver isValidationSuccessful ifTrue: [ ^ newInstance  ] ifFalse: [ ^ DvmNullObject new ].
	
]

{ #category : #converting }
DvmNullObject >> asString [
	"Answer a string that represents the receiver."

	^ 'A NullObject of a String generated because of the following errors: Error A, Error B, Error C'
]

{ #category : #accessing }
DvmNullObject >> derivedClass [
	^ derivedClass
]

{ #category : #accessing }
DvmNullObject >> derivedClass: aClass [
	derivedClass := aClass
]

{ #category : #accessing }
DvmNullObject >> errors [
	^ errors
]

{ #category : #accessing }
DvmNullObject >> errors: aCollection [ 

	errors := aCollection.
]
