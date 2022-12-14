Extension { #name : #Collection }

{ #category : #'*LangExtensions-Core' }
Collection >> containsOnlyElementsOfType: aClass [ 

	^ self inject: true into: [ :result :element | result & element isKindOf: aClass ].
]

{ #category : #'*LangExtensions-Core-removing' }
Collection >> removeIfPresent: anObject [
"Removes anObject returning itself if it is present, do nothing and return nil if it is absent"

	^ self remove: anObject ifAbsent: [].
]
