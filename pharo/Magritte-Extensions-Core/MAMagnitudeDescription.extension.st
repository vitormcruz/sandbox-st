Extension { #name : #MAMagnitudeDescription }

{ #category : #'*Magritte-Extensions-Core' }
MAMagnitudeDescription >> empty: aBoolean [
	"Sets wheter the magnitude can be empty or not."

	self propertyAt: #empty put: aBoolean
]
