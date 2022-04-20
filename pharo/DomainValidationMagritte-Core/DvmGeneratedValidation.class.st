Class {
	#name : #DvmGeneratedValidation,
	#superclass : #Object,
	#instVars : [
		'validatedParamName',
		'validationName',
		'validation',
		'validationPremisse',
		'paramIndex'
	],
	#category : 'DomainValidationMagritte-Core'
}

{ #category : #'instance creation' }
DvmGeneratedValidation class >> fromPropertyDescription: anAssociation andParamNamed: aSymbol indexedAt: anInteger [

	^ super new descriptionProperty: anAssociation; 
					validatedParamName: aSymbol; 
					paramIndex: anInteger.
	
]

{ #category : #accessors }
DvmGeneratedValidation >> descriptionProperty: anAssociation [ 

	validationName := anAssociation key.
	validationPremisse := anAssociation value.
	validation := DvmValidationPropertyMapper perform: (validationName , ':') asSymbol
														  with: validationPremisse. 
	

]

{ #category : #accessing }
DvmGeneratedValidation >> errorMessage: instrumentedObject forContext: context [

	^ (instrumentedObject class name , '.' ,  context methodSelector , '.' ,  validatedParamName , '.' , validationName) asString
]

{ #category : #accessing }
DvmGeneratedValidation >> paramIndex: anInteger [

	paramIndex := anInteger.
]

{ #category : #validation }
DvmGeneratedValidation >> validateFor: instrumentedObject withParamsProvided: parameters fromContext: context [
	| parameter |
	
	parameter := parameters at: paramIndex.
	(validation value: parameter) ifFalse: [ 
	    instrumentedObject issueError: (self errorMessage: instrumentedObject forContext: context)
                          withinContext: context 
   ].

	^ instrumentedObject.
	
]

{ #category : #accessing }
DvmGeneratedValidation >> validatedParamName: aSymbol [

	validatedParamName := aSymbol.
]
