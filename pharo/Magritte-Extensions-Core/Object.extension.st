Extension { #name : #Object }

{ #category : #'*Magritte-Extensions-Core' }
Object >> magritteDescriptionExtended [
" This method does what magritteDescription do only that you can define more than one description
for description method."

	^ MAPragmaBuilder forExtended: self
]
