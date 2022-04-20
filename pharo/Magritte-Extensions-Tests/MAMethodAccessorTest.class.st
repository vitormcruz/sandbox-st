Class {
	#name : #MAMethodAccessorTest,
	#superclass : #TestCase,
	#category : 'Magritte-Extensions-Tests'
}

{ #category : #tests }
MAMethodAccessorTest >> test_create_from_a_binary_selector_accessor_at_index_1 [
	| methodAccessor |
	
	methodAccessor := MAMethodParamAccessor from: (MASelectorAccessor selector: #@) atIndex: 1.
	
	self assert: methodAccessor selector equals: #@.
	self assert: methodAccessor index equals: 1.
]

{ #category : #tests }
MAMethodAccessorTest >> test_create_from_a_binary_selector_accessor_with_index_more_than_1 [
	
	self should: [ 	MAMethodParamAccessor from: (MASelectorAccessor selector: #@) atIndex: 2 ] 
	     raise: Error
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'You cannot define more than one param for a binary message' ].
		
	
	self should: [ 	MAMethodParamAccessor from: (MASelectorAccessor selector: #@) atIndex: 15 ] 
	     raise: Error
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'You cannot define more than one param for a binary message' ].

	

]

{ #category : #tests }
MAMethodAccessorTest >> test_create_from_a_keyword_selector_accessor_at_index_1 [
	| methodAccessor |
	
	methodAccessor := MAMethodParamAccessor from: (MASelectorAccessor selector: #s1:) atIndex: 1.
	
	self assert: methodAccessor selector equals: #s1:.
	self assert: methodAccessor index equals: 1.
]

{ #category : #tests }
MAMethodAccessorTest >> test_create_from_a_keyword_selector_accessor_at_index_more_than_1 [
	| methodAccessor |
	
	methodAccessor := MAMethodParamAccessor from: (MASelectorAccessor selector: #s1:) atIndex: 20.
	
	self assert: methodAccessor selector equals: #s1:.
	self assert: methodAccessor index equals: 20.
]

{ #category : #tests }
MAMethodAccessorTest >> test_create_from_an_unary_selector [
	
	self should: [ 	MAMethodParamAccessor from: (MASelectorAccessor selector: #unary) atIndex: 1 ] 
	     raise: Error
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'You cannot define a param for an unary message' ].
	
	self should: [ 	MAMethodParamAccessor from: (MASelectorAccessor selector: #unary) atIndex: 2 ] 
	     raise: Error
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'You cannot define a param for an unary message' ].
		
	self should: [ 	MAMethodParamAccessor from: (MASelectorAccessor selector: #unary) atIndex: 15 ] 
	     raise: Error
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'You cannot define a param for an unary message' ].


	

]
