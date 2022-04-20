Extension { #name : #Collection }

{ #category : #'*Magritte-Extensions-Core' }
Collection >> asMagritteContainer [

	^ MAContainer withAll: self. 
]
