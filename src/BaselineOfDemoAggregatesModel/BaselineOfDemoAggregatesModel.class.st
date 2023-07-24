Class {
	#name : #BaselineOfDemoAggregatesModel,
	#superclass : #BaselineOf,
	#category : #BaselineOfDemoAggregatesModel
}

{ #category : #baselines }
BaselineOfDemoAggregatesModel >> baseline: spec [

	<baseline>
	spec for: #common do: [
		"Dependencies"
		self loadCormas: spec.

		"Packages"
		spec
			package: 'DemoAggregates-Model' with: [ spec requires: #(Cormas) ];
			package: 'DemoAggregates-Model-Tests' with: [ spec requires: #( 'DemoAggregates-Model' ) ] ]
]

{ #category : #dependencies }
BaselineOfDemoAggregatesModel >> loadCormas: spec [

	spec
		baseline: 'Cormas'
		with: [ spec loads: #(Core); repository: 'github://cormas/cormas' ]
]
