Extension { #name : #Object }

{ #category : #'*LangExtensions-Core' }
Object >> chain [
	"Starts a chained operation"
	
	^ ChainObject new proxy: self.
]
