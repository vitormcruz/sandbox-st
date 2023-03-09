Class {
	#name : #BaselineOfPolaris,
	#superclass : #BaselineOf,
	#category : #BaselineOfPolaris
}

{ #category : #baselines }
BaselineOfPolaris >> baseline: spec [

	<baseline>
        
	spec for: #'common' do: [
		spec blessing: #'baseline';     
		
 	   baseline: 'Buoy' with: [ spec repository: 'github://ba-st/Buoy:v6.1.0/source' ];
		project: 'Buoy-Tests' copyFrom: 'Buoy' with: [ spec loads: #('Dependent-SUnit-Extensions') ];
	   baseline: 'LangExtensions' with: [ spec repository: 'gitlab://vitormcruz/sandbox-st:develop'; 
								 		 loads: #(core) ];
		
 	   baseline: 'Tome' with: [ spec repository: 'github://vitormcruz/tome:develop/pharo'; loads: #(core) ];
" 	   baseline: 'Grease' with: [ spec repository: 'github://SeasideSt/Grease:v1.9.0/repository'; loads: #(default) ];"
	
"		baseline:'Seaside3' with: [ spec repository: 'github://SeasideSt/Seaside:v3.5.0/repository'; loads: #(default) ];"

		"MaterialDesignLite must be declared after Seaside3 so that the correct version of Grease (1.7.x) is taken, otherwise, version 1.5.0 is taken"
  	   baseline: 'MaterialDesignLite'	with: [ spec repository: 'github://DuneSt/MaterialDesignLite:v2.4.2/src'; loads: #(core) ];	
		baseline: 'ValidationNotification' with: [ spec repository: 'github://vitormcruz/st_validation_notification:master/pharo'; loads: #(core) ];

		package: 'Polaris-Core' with: [ spec requires: #('LangExtensions' 'MaterialDesignLite' 'ValidationNotification') ];
		package: 'Polaris-Tests' with: [ spec requires: #('Polaris-Core' 'Buoy-Tests' 'Tome') ];
		
		group: 'default' with: #('dev');
		group: 'core' with: #('Polaris-Core' 'ValidationNotification');
		group: 'test' with: #(core 'Polaris-Tests');
		group: 'dev' with: #(test)	
	].
		
	
]
