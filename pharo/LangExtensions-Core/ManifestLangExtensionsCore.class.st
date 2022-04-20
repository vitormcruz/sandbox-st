"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestLangExtensionsCore,
	#superclass : #PackageManifest,
	#category : 'LangExtensions-Core-Manifest'
}

{ #category : #'code-critics' }
ManifestLangExtensionsCore class >> ruleRBBadMessageRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Collection #containsOnlyElementsOfType: #false)) #'2019-03-17T14:40:13.968314-03:00') )
]
