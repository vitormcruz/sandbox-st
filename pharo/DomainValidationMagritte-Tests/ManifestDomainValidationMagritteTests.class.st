"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestDomainValidationMagritteTests,
	#superclass : #PackageManifest,
	#category : 'DomainValidationMagritte-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestDomainValidationMagritteTests class >> ruleRBBadMessageRuleV1FalsePositive [
	^ #(#(#(#RGPackage #(#'DomainValidationMagritte-Tests')) #'2019-02-01T14:52:56.356857-02:00') )
]

{ #category : #'code-critics' }
ManifestDomainValidationMagritteTests class >> ruleRBShouldntRaiseErrorRuleV1FalsePositive [
	^ #(#(#(#RGPackage #(#'DomainValidationMagritte-Tests')) #'2019-01-29T08:47:35.855829-02:00') )
]
