Class {
	#name : #DvmValidationPropertyMapper,
	#superclass : #Object,
	#category : 'DomainValidationMagritte-Core'
}

{ #category : #'accessing-properties' }
DvmValidationPropertyMapper class >> empty: validationPremisse [

	^ [ :value | 
		validationPremisse ifTrue: [ true ]
								ifFalse: [ value isNotNil and: [value isNotEmpty]]
	]
]

{ #category : #'accessing-properties' }
DvmValidationPropertyMapper class >> min: validationPremisse [

	^ [:value | value >= validationPremisse].
]

{ #category : #'accessing-properties' }
DvmValidationPropertyMapper class >> required: validationPremisse [

	^ [:value | 
			validationPremisse ifTrue: [ value isNotNil ]
									 ifFalse: [ true ]	      
	  ].
]
