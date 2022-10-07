Extension { #name : #Object }

{ #category : #'*LangExtensions-Core' }
Object >> chain [
	"Starts a chained operation"
	
	^ AvDelegationProxy target: Object new 
							  handler: (ChainHandler new proxy: self).
]
