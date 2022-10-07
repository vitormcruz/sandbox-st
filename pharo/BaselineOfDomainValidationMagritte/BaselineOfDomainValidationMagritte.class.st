Class {
	#name : #BaselineOfDomainValidationMagritte,
	#superclass : #BaselineOf,
	#category : #BaselineOfDomainValidationMagritte
}

{ #category : #baselines }
BaselineOfDomainValidationMagritte >> baseline: spec [ 
    
	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline';
		     repository: 'gitlab://vitormcruz/sandbox-st';
		
		     baseline: 'LangExtensions' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
															     loads: #(core) ];
														
		     baseline: 'Tome' with: [ spec repository: 'gitlab://vitormcruz/tome:develop'; 
													 loads: #(core) ];
														
		     baseline: 'ValidationNotification' with: [ spec repository: 'gitlab://vitormcruz/st_validation_notification'; 
															     			 loads: #(core) ];
														
		     baseline: 'Mocketry' with: [ spec repository: 'github://dionisiydk/Mocketry:v4.0.6' ];
															
		     baseline: 'Magritte' with: [ spec repository: 'github://magritte-metamodel/magritte:v3.8'; 
 													     loads: #(Core) ];
												
			  package: 'Magritte-Extensions-Core' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop' ];
			  package: 'Magritte-Extensions-Tests' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'];										
		
			  package: 'DomainValidationMagritte-Core' with: [ spec requires: #('LangExtensions' 'Magritte' 'ValidationNotification') ];
			  package: 'DomainValidationMagritte-Tests' with: [ spec requires: #('DomainValidationMagritte-Core' 'Tome' 'Mocketry') ];
		     package: 'DomainValidationMagritte-Features' with: [ spec requires: #('LangExtensions' 'DomainValidationMagritte-Core') ];
		
 			  group: 'default' with: #('core' 'tests');
			  group: 'core' with: #('DomainValidationMagritte-Core' 'Magritte-Extensions-Core');
			  group: 'tests' with: #(core 'DomainValidationMagritte-Features' 'DomainValidationMagritte-Tests' 'Magritte-Extensions-Tests').
	].


]
