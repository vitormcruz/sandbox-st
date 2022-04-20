Extension { #name : #Dictionary }

{ #category : #'*DomainValidationMagritte-Core' }
Dictionary >> asValidationsForParam: aSymbol indexedAt: anInteger [

	^ self associations collect: [:descriptionOfParam | 
		descriptionOfParam asValidationForParam: aSymbol indexedAt: anInteger
	].
]
