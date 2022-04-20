"
I am a test data class.
"
Class {
	#name : #DvmDescribedClassForFeatureTest,
	#superclass : #Object,
	#traits : 'TValidationInstrumentation',
	#classTraits : 'TValidationInstrumentation classTrait',
	#category : 'DomainValidationMagritte-Features'
}

{ #category : #'magritte-description' }
DvmDescribedClassForFeatureTest class >> domainDescription [
	<magritteDescription>
		
	^ MAMethodDescription new whereParams: { MAStringDescription new accessor: #forEmployee; required: true.
										             MANumberDescription new accessor: #setSalary; required: true. }.
	

]

{ #category : #accessing }
DvmDescribedClassForFeatureTest >> errorArray [
	 ^ {'no error'}
]

{ #category : #'test data' }
DvmDescribedClassForFeatureTest >> forEmployee: aString setSalary: anInteger [ 
	"Don't need to have a implementation, the proxy will do the validation."
]
