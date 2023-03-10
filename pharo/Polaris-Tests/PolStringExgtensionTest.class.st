Class {
	#name : #PolStringExgtensionTest,
	#superclass : #TestCase,
	#category : #'Polaris-Tests-Extensions-String'
}

{ #category : #tests }
PolStringExgtensionTest >> test_copyReplacingAll_respectivelyByReplacing_list_with_fewer_elements [

	self should: [ 'test' copyReplacingAll: #('t') respectivelyBy: #('a' 'b') ] 
		  raise: Error 
		  whoseDescriptionIncludes: 'Lists sizes don''t match'  
		  description: 'Expected error didn''t happened'  
	
]

{ #category : #tests }
PolStringExgtensionTest >> test_copyReplacingAll_respectivelyByReplacing_list_with_more_elements [

	self should: [ 'test' copyReplacingAll: #('t' 'e') respectivelyBy: #('a') ] 
		  raise: Error 
		  whoseDescriptionIncludes: 'Lists sizes don''t match'  
		  description: 'Expected error didn''t happened'  
	
]

{ #category : #tests }
PolStringExgtensionTest >> test_copyReplacingAll_respectivelyBy_N_replacements [

	self assert: ('One Two Three' copyReplacingAll: #('One' 'Two' 'Three') respectivelyBy: #('A' 'B' 'C'))
		  equals: 'A B C'.
	
]

{ #category : #tests }
PolStringExgtensionTest >> test_copyReplacingAll_respectivelyBy_one_replacement [

	self assert: ('One Two Three' copyReplacingAll: #('One') respectivelyBy: #('A'))
		  equals: 'A Two Three'.
	
]

{ #category : #tests }
PolStringExgtensionTest >> test_copyReplacingAll_respectivelyBy_with_nil_nil [

	self assert: ('test' copyReplacingAll: nil respectivelyBy: nil)
		  equals: 'test'.
	
]

{ #category : #tests }
PolStringExgtensionTest >> test_copyReplacingAll_respectivelyBy_with_nil_nonnil [

	self assert: ('test' copyReplacingAll: nil respectivelyBy: #('anything'))
		  equals: 'test'.
	
]

{ #category : #tests }
PolStringExgtensionTest >> test_copyReplacingAll_respectivelyBy_with_nonnil_nil [

	self assert: ('test' copyReplacingAll: #('anything') respectivelyBy: nil)
		  equals: 'test'.
	
]
