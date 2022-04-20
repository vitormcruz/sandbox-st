Extension { #name : #Object }

{ #category : #'*DomainValidationMagritte-Core' }
Object class >> linkDomainValidations [

	self magritteDescriptionExtended installDerivedValidationsInto: self.
]
