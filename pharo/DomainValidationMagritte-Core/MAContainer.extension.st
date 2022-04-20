Extension { #name : #MAContainer }

{ #category : #'*DomainValidationMagritte-Core' }
MAContainer >> installDerivedValidationsInto: aClass [

	self do: [ :desc | 
		(aClass >> desc accessor writeSelector) ast link: desc asGeneratedValidationMetaLink.
	].
]
