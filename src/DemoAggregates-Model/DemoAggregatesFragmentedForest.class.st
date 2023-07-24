Class {
	#name : #DemoAggregatesFragmentedForest,
	#superclass : #CMSpatialEntityNotConnex,
	#category : #'DemoAggregates-Model'
}

{ #category : #'pov symbols' }
DemoAggregatesFragmentedForest class >> CMSpatialEntityPOV_FragmentedEntity [

	^ Array with: 0.0 with: 0.670004 with: 0.0
]

{ #category : #'pov symbols' }
DemoAggregatesFragmentedForest class >> defaultColor [

	^ Color red: 0.0 green: 0.670004 blue: 0.0
]

{ #category : #accessing }
DemoAggregatesFragmentedForest class >> entityName [

	^ 'FragmentedForest'
]

{ #category : #testing }
DemoAggregatesFragmentedForest class >> isAbstract [

	^ false
]

{ #category : #procedure }
DemoAggregatesFragmentedForest >> minSurface [

	^ Cormas minOf: #surface amongObjects: self components
]

{ #category : #control }
DemoAggregatesFragmentedForest >> step [

	self components do: [ :arg1 | arg1 swell ].
	self changed
]

{ #category : #control }
DemoAggregatesFragmentedForest >> swell [

	super swell
]
