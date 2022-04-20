Class {
	#name : #MAMethodDescription,
	#superclass : #MAContainer,
	#category : 'Magritte-Extensions-Core'
}

{ #category : #testing }
MAMethodDescription class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
MAMethodDescription class >> new [

	Error signal: 'You should use one of the instance creation methods of this class'.
]

{ #category : #'instance creation' }
MAMethodDescription class >> whereParams: aCollection [ 

	^ super new whereParams: aCollection.
]

{ #category : #accessing }
MAMethodDescription >> accessor [
	
	Error signal: 'A method description do not have an accessor, it behaves more like a container'.
]

{ #category : #accessing }
MAMethodDescription >> accessor: anObject [
	
	Error signal: 'You must not define an accessor for a method description.'.
]

{ #category : #'as yet unclassified' }
MAMethodDescription >> asValidations [

	^ children chain collectWithIndex: [:description : index | 
			description properties asValidationsForParam: description accessor readSelector indexedAt: index.
	  ]; flattened.
]

{ #category : #enumerating }
MAMethodDescription >> countBinaryParams: anOrderedCollection ifMoreThanOneDo: aBlock [

	^ (anOrderedCollection count: [ :paramDesc | paramDesc accessor selector isBinary ]) > 1
		ifTrue: aBlock
]

{ #category : #description }
MAMethodDescription >> whereParams: anOrderedCollection [ 
	
	anOrderedCollection ifEmpty: [ Error signal: 'You should define at least one parameter for a method description' ].
	self countBinaryParams: anOrderedCollection 
 		  ifMoreThanOneDo: [Error signal: 'You cannot define two params with a binary selector. ', 
											      'A binary selector must be defined for a method with only one parameter'  ].

	children := anOrderedCollection.
	children doWithIndex: [ :paramDesq :i | 
		paramDesq accessor: (MAMethodParamAccessor from: paramDesq accessor atIndex: i)
	]
	

]
