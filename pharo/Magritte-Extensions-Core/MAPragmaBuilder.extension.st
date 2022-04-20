Extension { #name : #MAPragmaBuilder }

{ #category : #'*Magritte-Extensions-Core' }
MAPragmaBuilder >> buildExtended: anObject cache: cache [
	| container |
	container := cache at: anObject put: (self buildContainer: anObject).
	
	^ container
		addAll: (self buildDescriptions: anObject) flattened;
		yourself.

]

{ #category : #'*Magritte-Extensions-Core' }
MAPragmaBuilder >> forExtended: anObject [
	| cache |
	cache := MADynamicDescriptionCache value.
	
	MADynamicDescriptionCache use: cache during: [
		^ cache at: anObject ifAbsentPut: [ self buildExtended: anObject cache: cache ] ]
]

{ #category : #'*Magritte-Extensions-Core' }
MAPragmaBuilder classSide >> forExtended: anObject [
	^ self new forExtended: anObject
]
