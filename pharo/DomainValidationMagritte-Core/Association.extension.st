Extension { #name : #Association }

{ #category : #'*DomainValidationMagritte-Core' }
Association >> asValidationForParam: aSymbol indexedAt: anInteger [
	^ DvmGeneratedValidation fromPropertyDescription: self andParamNamed: aSymbol indexedAt: anInteger.
]
