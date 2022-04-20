Class {
	#name : #MAEDescriptionTest,
	#superclass : #TestCase,
	#category : 'Magritte-Extensions-Tests'
}

{ #category : #tests }
MAEDescriptionTest >> test_description_only_with_accessor [

	self shouldnt: [MADescription basicNew accessor: #p1:]
        raise: ParamDescriptionError.

]

{ #category : #tests }
MAEDescriptionTest >> test_description_only_with_paramSelector [

	self shouldnt: [MADescription basicNew paramSelector: #p1:]
        raise: ParamDescriptionError.

]

{ #category : #tests }
MAEDescriptionTest >> test_description_with_accessor_defined_after_paramSelector [

	self skip: 'I think I am going to implement this using my implementation of validation with magritte and 
			 		slots, but first I must implement that, and to do so paramSelector is necessary, so this test is 
					the long triangulation of many of what I am experimenting.'.

	self should: [MADescription basicNew paramSelector: #p1:; accessor: #p1:]
        raise: ParamDescriptionError
		  withExceptionDo: [ :ex | 
		      self assert: ex messageText 
					  equals: 'You should not define accessor and paramSelector on the same description.', 
							    ' Use accessor on normal description and paramSelector for descriptions of method parameters.'
		  ].

]

{ #category : #tests }
MAEDescriptionTest >> test_description_with_accessor_defined_before_paramSelector [

	self should: [MADescription basicNew accessor: #p1:; paramSelector: #p1:]
        raise: ParamDescriptionError
		  withExceptionDo: [ :ex | 
		      self assert: ex messageText 
					  equals: 'You should not define accessor and paramSelector on the same description.', 
							    ' Use accessor on normal description and paramSelector for descriptions of method parameters.'
		  ].

]
