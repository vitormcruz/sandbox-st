Extension { #name : #MADescription }

{ #category : #'*DomainValidationMagritte-Core' }
MADescription >> asGeneratedValidationMetaLink [
	^ MetaLink new
		metaObject: (DvmValidationLink forDescription: self);
		selector: #validateOperation:ofObject:sentWith:andRunningWithingContext:;
		arguments: #(#operation #object #arguments #context);
		control: #instead
]

{ #category : #'*DomainValidationMagritte-Core' }
MADescription >> asValidations [

	^ self properties asValidationsForParam: accessor readSelector indexedAt: 1.
]
