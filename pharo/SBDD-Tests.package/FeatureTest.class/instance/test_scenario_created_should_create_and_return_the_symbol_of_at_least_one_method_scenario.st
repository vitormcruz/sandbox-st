tests scenario outline
test_scenario_created_should_create_and_return_the_symbol_of_at_least_one_method_scenario

	self should: [FeatureSubclassForTest class compile: '
						scenarioOutlineTestCreation
						<scenarioOutline>
						<createdForTest>
						
						^ #()
					'.] 
		  raise: ScenarioOutlineGeneratedNoScenario.