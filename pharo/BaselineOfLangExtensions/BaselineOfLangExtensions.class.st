Class {
	#name : #BaselineOfLangExtensions,
	#superclass : #BaselineOf,
	#category : #BaselineOfLangExtensions
}

{ #category : #baselines }
BaselineOfLangExtensions >> baseline: spec [ 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline';
			  repository: 'github://vitormcruz/sandbox-st/pharo/';
			
	 	   	  baseline: 'Avatar' with: [ spec repository: 'github://vitormcruz/avatar:createBaseline'; loads: #(core) ];	
		     package: 'ComplexCondition-Core' with: [ spec repository: 'http://www.squeaksource.com/ComplexCondition'; 
																	     file: 'ComplexCondition-espin.1' ];
															
			  package: 'LangExtensions-Core' with: [ spec requires: #('ComplexCondition-Core' 'Avatar') ];
			
		     package: 'ComplexCondition-Tests' with: [ spec repository: 'http://www.squeaksource.com/ComplexCondition'; 
																	     file: 'ComplexCondition-espin.1' ];
			  package: 'LangExtensions-Tests' with: [ spec requires: #('LangExtensions-Core' 'ComplexCondition-Tests') ].
		
		spec group: 'default' with: #('core');
			  group: 'core'    with: #('LangExtensions-Core');
			  group: 'tests'   with: #('LangExtensions-Tests' 'core') 
			
	].


]
