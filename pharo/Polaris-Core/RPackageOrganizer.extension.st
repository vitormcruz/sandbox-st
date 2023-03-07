Extension { #name : #RPackageOrganizer }

{ #category : #'*Polaris-Core' }
RPackageOrganizer >> packageNamed: aSymbol  ifPresent: foundBlock [
	^ packages 
		at: aSymbol asSymbol 
		ifPresent: foundBlock
]
