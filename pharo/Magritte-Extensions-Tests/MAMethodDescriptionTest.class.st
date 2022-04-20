"
See my name.
"
Class {
	#name : #MAMethodDescriptionTest,
	#superclass : #TestCase,
	#instVars : [
		'validMethodDescription'
	],
	#category : 'Magritte-Extensions-Tests'
}

{ #category : #tests }
MAMethodDescriptionTest >> paramsSelectorsAndIndexes: methodDescription [

	^ methodDescription children collect: [ :paramDesc | paramDesc accessor selector -> paramDesc accessor index ]
]

{ #category : #running }
MAMethodDescriptionTest >> setUp [

	validMethodDescription := (MAMethodDescription whereParams: { MAStringDescription new accessor: #p1:. }).
]

{ #category : #tests }
MAMethodDescriptionTest >> test_accessor_definition_for_method_description [

	self should: [validMethodDescription accessor: #anything] 
		  raise: Error 
		  withExceptionDo: [ :ex | self 
		      assert: ex messageText equals: 'You must not define an accessor for a method description.' 
		  ].
]

{ #category : #tests }
MAMethodDescriptionTest >> test_get_accessor_for_method_description [

	self should: [validMethodDescription accessor] 
		  raise: Error 
		  withExceptionDo: [ :ex | self 
		      assert: ex messageText equals: 'A method description do not have an accessor, it behaves more like a container' .
		  ].
]

{ #category : #tests }
MAMethodDescriptionTest >> test_method_description_with_N_params_being_keywords [
	| methodDescription |
	
	methodDescription := MAMethodDescription whereParams: {MAStringDescription new accessor: #p1:.
																		   MAStringDescription new accessor: #p2:.
																		   MAStringDescription new accessor: #p3:.}.

	self assertCollection: (self paramsSelectorsAndIndexes: methodDescription)
		  equals: {#p1: -> 1.
				  	 #p2: -> 2.
					 #p3: -> 3.}
]

{ #category : #tests }
MAMethodDescriptionTest >> test_method_description_with_one_param_being_a_binary [
	| methodDescription |
	
	methodDescription := MAMethodDescription whereParams: {(MAStringDescription new accessor: #@)}.
	self assertCollection: (self paramsSelectorsAndIndexes: methodDescription)
		  equals: {(#@ -> 1)}
]

{ #category : #tests }
MAMethodDescriptionTest >> test_method_description_with_one_param_being_a_keyword [
	| methodDescription |
	
	methodDescription := MAMethodDescription whereParams: {(MAStringDescription new accessor: #p1:)}.
	self assertCollection: (self paramsSelectorsAndIndexes: methodDescription)
		  equals: {#p1: -> 1}
]

{ #category : #tests }
MAMethodDescriptionTest >> test_method_description_with_one_param_being_a_unary [

	self should: [ MAMethodDescription whereParams: {(MAStringDescription new accessor: #unary)} ] 
	     raise: Error
		  withExceptionDo: [ :ex | ex messageText = 'You cannot define a param for an unary message' ].

]

{ #category : #tests }
MAMethodDescriptionTest >> test_method_description_with_two_params_being_binaries [
	
	self should: [ MAMethodDescription whereParams: {(MAStringDescription new accessor: #@). (MAStringDescription new accessor: #*).} ]
		  raise: Error
		  withExceptionDo: [ :ex | self assert: ex messageText 
												 equals: 'You cannot define two params with a binary selector. ', 
															'A binary selector must be defined for a method with only one parameter'].

]

{ #category : #tests }
MAMethodDescriptionTest >> test_method_description_without_params [

	self should: [ MAMethodDescription whereParams: { }  ]
		  raise: Error
		  withExceptionDo: [ :ex  |
		     self assert: ex messageText equals: 'You should define at least one parameter for a method description'
		  ]

]
