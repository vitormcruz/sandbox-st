"
I define and implement the various features of the automatic creation of a new Project.
"
Class {
	#name : #'Start_A_New_Project_Feature',
	#superclass : #SbddFeature,
	#category : 'Guide-Tests'
}

{ #category : #tests }
Start_A_New_Project_Feature >> Create_Basic_Project_Feature [

	<scenario>

	self scenario: 'Create a Basic new Project' 
		  def: 'Given a new project named "NewProject" never created before
         		   when I create "NewProject" pointing to "github://someuser/newproject/pharo" repository
         		   then a new package BaselineOfNewProject is created with a method called "baseline" categorized 
		         in the "baseline" protocol containing the following code source:
				   "baseline: spec 
			  		
				  	  <baseline>
						
					  spec for: #''common'' do: [
						  spec 
							  repository: ''github://someuser/newproject/pharo'';
							  package: #''NewProject'';
							  package: #''NewProject-Tests'' with: [ spec requires: ''NewProject''];
							  group: ''default'' with: #(''core'' ''tests'');
							  group: ''core'' with: #(''NewProject-Core'');
							  group: ''tests'' with: #(''NewProject-Tests'') 
					  ].
				"
			alongside with two other empty packages named "NewProject" "NewProject-Tests" '
			run: [:extractedParams | self create_Basic_Project_Def: extractedParams].
			
	
   
   
]
