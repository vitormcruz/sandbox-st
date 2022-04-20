Class {
	#name : #DvmValidationPropertyMapperTest,
	#superclass : #TestCase,
	#category : 'DomainValidationMagritte-Tests'
}

{ #category : #'tests - empty' }
DvmValidationPropertyMapperTest >> test_empty_validation_false_on_empty_collection [

	| validation |
	
	validation := DvmValidationPropertyMapper empty: false.
	self deny: (validation value: { }).
]

{ #category : #'tests - empty' }
DvmValidationPropertyMapperTest >> test_empty_validation_false_on_filled_collection [

	| validation |
	
	validation := DvmValidationPropertyMapper empty: false.
	self assert: (validation value: {'dummy'}).
]

{ #category : #'tests - empty' }
DvmValidationPropertyMapperTest >> test_empty_validation_false_on_nil_collection [

	| validation |
	
	validation := DvmValidationPropertyMapper empty: false.
	self deny: (validation value: nil).
]

{ #category : #'tests - empty' }
DvmValidationPropertyMapperTest >> test_empty_validation_true_on_empty_collection [

	| validation |
	
	validation := DvmValidationPropertyMapper empty: true.
	self assert: (validation value: { }).
]

{ #category : #'tests - empty' }
DvmValidationPropertyMapperTest >> test_empty_validation_true_on_filled_collection [

	| validation |
	
	validation := DvmValidationPropertyMapper empty: true.
	self assert: (validation value: {'dummy'}).

]

{ #category : #'tests - empty' }
DvmValidationPropertyMapperTest >> test_empty_validation_true_on_nil_collection [

	| validation |
	
	validation := DvmValidationPropertyMapper empty: true.
	self assert: (validation value: nil).
]

{ #category : #'tests - min' }
DvmValidationPropertyMapperTest >> test_min_validation_on_higher_value [

	| validation |
	
	validation := DvmValidationPropertyMapper min: 20.
	self assert: (validation value: 21).
]

{ #category : #'tests - min' }
DvmValidationPropertyMapperTest >> test_min_validation_on_lesser_value [

	| validation |
	
	validation := DvmValidationPropertyMapper min: 20.
	self deny: (validation value: 19).
]

{ #category : #'tests - min' }
DvmValidationPropertyMapperTest >> test_min_validation_on_same_value [

	| validation |
	
	validation := DvmValidationPropertyMapper min: 20.
	self assert: (validation value: 20).
]

{ #category : #'tests - required' }
DvmValidationPropertyMapperTest >> test_required_false_validation_on_defined_object [

	| validation |
	
	validation := DvmValidationPropertyMapper required: false.
	self assert: (validation value: 'Some Object').
]

{ #category : #'tests - required' }
DvmValidationPropertyMapperTest >> test_required_false_validation_on_undefined_object [

	| validation |
	
	validation := DvmValidationPropertyMapper required: false.
	self assert: (validation value: nil).		
]

{ #category : #'tests - required' }
DvmValidationPropertyMapperTest >> test_required_true_validation_on_defined_object [

	| validation |
	
	validation := DvmValidationPropertyMapper required: true.
	self assert: (validation value: 'Some Object').		
]

{ #category : #'tests - required' }
DvmValidationPropertyMapperTest >> test_required_true_validation_on_undefined_object [

	| validation |
	
	validation := DvmValidationPropertyMapper required: true.
	self deny: (validation value: nil).		
]
