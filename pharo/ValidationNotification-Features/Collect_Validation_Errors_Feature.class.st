Class {
	#name : #'Collect_Validation_Errors_Feature',
	#superclass : #SbddFeature,
	#traits : 'TValidationObserver',
	#classTraits : 'TValidationObserver classTrait',
	#category : 'ValidationNotification-Features'
}

{ #category : #'as yet unclassified' }
Collect_Validation_Errors_Feature >> Collect_Errors_Notifications_From_Execution_Def: aCollection [


]

{ #category : #scenarios }
Collect_Validation_Errors_Feature >> Collect_Errors_Notifications_From_Execution_Scenario [

	<scenarioOutline>

	self scenarioOutline: 'Collect errors notifications from inspected execution' 
		  def: 'When I inspec a {execution type} execution, the following errors will be found: {list of error}'
		  examples:  #(     'execution type'    'list of errors'                             ) asHeaderFor
					     - #(    'valid'               'no error'                               )
						  - #(   'invalid'           'Mandatory field "name" was not provided, ' )
		  run: [ :executionType :listError | self Collect_Errors_Notifications_From_Execution_Def: {executionType. listError} ].
]
