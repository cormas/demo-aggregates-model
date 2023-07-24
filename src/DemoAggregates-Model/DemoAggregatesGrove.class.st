Class {
	#name : #DemoAggregatesGrove,
	#superclass : #CMSpatialEntityAggregate,
	#category : #'DemoAggregates-Model'
}

{ #category : #'pov symbols' }
DemoAggregatesGrove class >> CMSpatialEntityPOV_Grove [

	^ Array with: 0.0 with: 1.0 with: 0.0
]

{ #category : #'pov symbols' }
DemoAggregatesGrove class >> CMSpatialEntityPOV_big [

	^ Array with: 0.0 with: 0.340007 with: 0.0
]

{ #category : #'pov symbols' }
DemoAggregatesGrove class >> CMSpatialEntityPOV_medium [

	^ Array with: 0.0 with: 0.670004 with: 0.0
]

{ #category : #'pov symbols' }
DemoAggregatesGrove class >> CMSpatialEntityPOV_small [

	^ Array with: 0.0 with: 1.0 with: 0.0
]

{ #category : #'pov symbols' }
DemoAggregatesGrove class >> defaultColor [

	^ Color green
]

{ #category : #accessing }
DemoAggregatesGrove class >> entityName [

	^ 'Grove'
]

{ #category : #testing }
DemoAggregatesGrove class >> isAbstract [

	^ false
]

{ #category : #control }
DemoAggregatesGrove >> expand [

	| tmp1 |
	tmp1 := self surround elementsWithMaxValue: #forestSurroundingRatio.
	tmp1 size >= (self surround size / 10) ifTrue: [ 
		tmp1 := tmp1 selectRandomlySubCollectionSize: (self surround size / 10) rounded ].
	tmp1 do: [ :arg1 | arg1 tree: true ]
]

{ #category : #pov }
DemoAggregatesGrove >> povSize [

	self components size < 50 ifTrue: [ ^ #small ].
	self components size < 250 ifTrue: [ ^ #medium ].
	^ #big
]

{ #category : #procedure }
DemoAggregatesGrove >> setForest [

	self components do: [ :arg1 | arg1 tree: true ]
]

{ #category : #control }
DemoAggregatesGrove >> swell [

	^ super swell and: [ 
		  self components do: [ :arg1 | arg1 tree: true ].
		  true ]
]
