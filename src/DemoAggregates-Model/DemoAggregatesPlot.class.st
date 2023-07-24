Class {
	#name : #DemoAggregatesPlot,
	#superclass : #CMSpatialEntityElement,
	#instVars : [
		'seed',
		'tree'
	],
	#category : #'DemoAggregates-Model'
}

{ #category : #'pov symbols' }
DemoAggregatesPlot class >> CMSpatialEntityPOV_Plot [

	^ Array with: 1.0 with: 1.0 with: 0.0
]

{ #category : #'pov symbols' }
DemoAggregatesPlot class >> CMSpatialEntityPOV_black [

	^ Array with: 0.0 with: 0.0 with: 0.0
]

{ #category : #'pov symbols' }
DemoAggregatesPlot class >> CMSpatialEntityPOV_blue [

	^ Array with: 0.0 with: 0.0 with: 1.0
]

{ #category : #'pov symbols' }
DemoAggregatesPlot class >> CMSpatialEntityPOV_brown [

	^ Array with: 0.670004 with: 0.670004 with: 0.0
]

{ #category : #'pov symbols' }
DemoAggregatesPlot class >> CMSpatialEntityPOV_chartreuse [

	^ Array with: 0.0 with: 0.670004 with: 0.670004
]

{ #category : #'pov symbols' }
DemoAggregatesPlot class >> CMSpatialEntityPOV_empty [

	^ Array with: 0.0 with: 1.0 with: 0.0
]

{ #category : #'pov symbols' }
DemoAggregatesPlot class >> CMSpatialEntityPOV_tree [

	^ Array with: 0.0 with: 1.0 with: 0.0
]

{ #category : #'pov symbols' }
DemoAggregatesPlot class >> SpatialEntityPOV_empty [

	<pov: #tree>
	^ Array with: 1.0 with: 1.0 with: 1.0
]

{ #category : #'pov symbols' }
DemoAggregatesPlot class >> SpatialEntityPOV_tree [

	<pov: #tree>
	^ Array with: 0.0 with: 0.670004 with: 0.0
]

{ #category : #'pov symbols' }
DemoAggregatesPlot class >> defaultColor [

	^ Color yellow
]

{ #category : #accessing }
DemoAggregatesPlot class >> entityName [

	^ 'Plot'
]

{ #category : #testing }
DemoAggregatesPlot class >> isAbstract [

	^ false
]

{ #category : #'default value' }
DemoAggregatesPlot class >> seed_default [

	^ false
]

{ #category : #'parameter unit' }
DemoAggregatesPlot class >> seed_type [

	^ Boolean
]

{ #category : #'default value' }
DemoAggregatesPlot class >> tree_default [

	^ false
]

{ #category : #'parameter unit' }
DemoAggregatesPlot class >> tree_type [

	^ Boolean
]

{ #category : #converting }
DemoAggregatesPlot >> asString [
	" Private - See superimplementor's comment "

	^ String streamContents: [ : stream |
		stream 
			<< super asString;
			cr;
			<< 'tree: ';
			<< tree asString ]
]

{ #category : #testing }
DemoAggregatesPlot >> belongToAggregate [

	^ self theCSE notNil and: [ 
		  (self theCSE includesKey: #Aggregate) and: [ 
			  (self theCSE at: #Aggregate) notNil ] ]
]

{ #category : #control }
DemoAggregatesPlot >> forestSurroundingRatio [

	^ (self neighbourhood select: [ :arg1 | arg1 belongToAggregate ])
		  size / self neighbourhood size
]

{ #category : #init }
DemoAggregatesPlot >> init [

	self seed: false
]

{ #category : #init }
DemoAggregatesPlot >> initAtt [

	super init.
	self
		seed: false;
		tree: Cormas random < 0.5
]

{ #category : #testing }
DemoAggregatesPlot >> isSeed [

	^ self seed = true
]

{ #category : #testing }
DemoAggregatesPlot >> isTree [

	^ self tree
]

{ #category : #control }
DemoAggregatesPlot >> newSeedAB [

	self seed isNil ifTrue: [ 
		Cormas random < 0.01 ifTrue: [ self seed: #newA ] ].
	self seed isNil ifTrue: [ 
		Cormas random < 0.02 ifTrue: [ self seed: #newB ] ]
]

{ #category : #control }
DemoAggregatesPlot >> newState [

	self seed: false.
	Cormas random < 0.005 ifTrue: [ 
		self tree
			ifTrue: [ 
				self
					tree: false;
					seed: nil ]
			ifFalse: [ 
				self
					tree: true;
					seed: true ] ]
]

{ #category : #pov }
DemoAggregatesPlot >> povSeed [

	self isSeed ifTrue: [ ^ #seed ].
	(self myCSE: DemoAggregatesGrove) ifNil: [ ^ #empty ].
	^ (self theCSE at: #DemoAggregatesGrove) colorId
]

{ #category : #pov }
DemoAggregatesPlot >> povTree [

	self tree ifTrue: [ ^ #tree ].
	^ #empty
]

{ #category : #accessing }
DemoAggregatesPlot >> seed [

	| tmp1 |
	tmp1 := seed.
	^ tmp1 ifNil: [ seed := false ] ifNotNil: [ tmp1 ]
]

{ #category : #accessing }
DemoAggregatesPlot >> seed: arg1 [

	seed = arg1 ifTrue: [ ^ nil ].
	seed := arg1.
	self changed
]

{ #category : #accessing }
DemoAggregatesPlot >> tree [

	| tmp1 |
	tmp1 := tree.
	^ tmp1 ifNil: [ tree := false ] ifNotNil: [ tmp1 ]
]

{ #category : #accessing }
DemoAggregatesPlot >> tree: arg1 [

	tree = arg1 ifTrue: [ ^ nil ].
	tree := arg1.
	self changed
]
