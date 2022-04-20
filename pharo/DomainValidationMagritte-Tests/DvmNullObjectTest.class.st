Class {
	#name : #DvmNullObjectTest,
	#superclass : #TestCase,
	#category : 'DomainValidationMagritte-Tests-Instrument'
}

{ #category : #tests }
DvmNullObjectTest >> testAsStringWithThreeErrors [

	| nullObjectDescription |
	
	nullObjectDescription := (DvmNullObject newBecauseOfErrors: #('Error A' 'Error B' 'Error C') whileCreatingA: String) asString.
	self assert: nullObjectDescription equals: 'A NullObject of a String generated because of the following errors: Error A, Error B, Error C'.
]

{ #category : #tests }
DvmNullObjectTest >> testNew [

	self should: [ DvmNullObject new ]
		  raise: Error 
		  withExceptionDo: [ :ex | ex messageText = 'A NullObject should be created with one of it''s custom instance creation methods.' ]
]

{ #category : #tests }
DvmNullObjectTest >> testNewWithNoClass [

	self should: [ DvmNullObject newBecauseOfErrors: #('Error A') whileCreatingA: nil ]
		  raise: Error
		  withExceptionDo: [:ex | self assert: ex messageText
												equals: ('Null objects should be a representation of a Class whose creation has failed,',
															' but you do not provided this information.')].
	
]

{ #category : #tests }
DvmNullObjectTest >> testNewWithNoErrors [

	self should: [ DvmNullObject newBecauseOfErrors: #() whileCreatingA: String ]
		  raise: Error
		  withExceptionDo: [:ex | self assert: ex messageText
										      equals: 'Null objects should be created with at least one underlined error, but none was provided.'].
]
