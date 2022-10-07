Class {
	#name : #BaselineOfSandbox,
	#superclass : #BaselineOf,
	#category : #BaselineOfSandbox
}

{ #category : #baselines }
BaselineOfSandbox >> baseline: spec [ 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline';
			  repository: 'github://vitormcruz/sandbox-st/';
			  baseline: 'LangExtensions' with: [ spec repository: 'github://vitormcruz/sandbox-st:develop'; 
													 		     loads: #(tests) ];
														
			  baseline: 'DomainValidationMagritte' with: [ spec repository: 'github://vitormcruz/sandbox-st:develop'; 
															             loads: #(tests) ].
		
		spec group: 'default' with: #('LangExtensions' 'DomainValidationMagritte').
	].


]
