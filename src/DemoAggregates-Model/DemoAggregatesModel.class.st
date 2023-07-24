"
'The CMDemo_Aggregates model is a didactic model that allows to test two different ways to create spatial aggregates with Cormas. This model introduces the functionning principles of Cormas aggregative spatial entities. In the inheritage tree of the Cormas generic spatial entities, the compound spatial entity SpatialEntity_Set is specialized in :
      	* SpatialEntityAggregate  whose components should be contiguous (the Groves),
   		* SpatialEntityNotConnex  whose components may not be contiguous (the FragmentedForests).

The operations of aggregation-disintegration are based on the two attributes: ''components'' (a collection of lower level spatial entities) and ''theCSE'' (a register of belonging to higer level spatial entities). 

In the first scenario (initForests - stepForests:), the components are defined as sets of contiguous cells sharing a same condition. The initialization loads a spatial grid made of 50*50 cells (instances of the CMPlot class) from a file. Each plot has either #tree (aggregation condition) or #empty as value of its ''context'' attribute. The effective instanciation of the Groves (SpatialEntityAggregate) is done by selecting the connected plots with #tree as context, plus an additional constraint about a minimum number (set to 25) of contiguous plots verifying the aggregation condition. 
To let co-exist in the same model several spatial entities defined at different levels gives a great flexibility to write the dynamics of the model. Some of the processes are more easily described at the cellular level (newContext), as for some others, the aggregated level is more suitable (expand or swell). In this didactic and simplistic example, each plot has a fixed (very low) probability to switch its context attribute value. At the level of the groves, a spreading process from the edges is written like this: a given number (corresponding to the hundredth of the total number of components of the forestry entity) of cells at the outside edge are going to be aggregated to the forest. In order to keep a high compacity to the forestry entities, a priority is given to the cells that are surrounded by the highest number of already aggregated cells. 
      
In the second one, 10 seed cells are randomly chosen in the 50*50 spatial grid. 10 aggregates are intialized with one of these seeds as a single component. The iterative building process of the aggregates relies on the integration, among the cells belonging to the outside edge of each aggregate, of all the one that do not yet belong to another aggregate'
"
Class {
	#name : #DemoAggregatesModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'thePlots',
		'theGroves',
		'seeds',
		'partitionsAverageSize',
		'nbCells',
		'theFragmentedForests'
	],
	#category : #'DemoAggregates-Model'
}

{ #category : #description }
DemoAggregatesModel class >> aProposDe [

	| tmp1 |
	tmp1 := 'Ce modele illustre les principes d''utilisation des entites spatiales agregatives de Cormas. Dans l''arbre d''heritage des entites spatiales generiques de Cormas, l''entite spatiale composee SpatialEntity_Set se specialise :
      * SpatialEntityAggregate  dont les composants respectent une contrainte de contiguite
      * SpatialEntityNotConnex  dont les composants peuvent etre disjoints.

Les operations d''agregation-desagregation sont realisees a partir des deux attributs, components        (une collection d''entites spatiales de niveau hierarchique inferieur) et theCSE (un registre d''appartenance a des entites spatiales de niveaux superieurs). 

Le modele TSE permet de tester deux facons de creer des agregats avec Cormas.

La premiere consiste a definir les composantes comme des ensembles de cellules contigues partageant une meme condition. On commence par charger une grille de 50*50 cellules de type Cell dont l''attribut context est soit #forest (condition d''agregation), soit #empty. La creation des entites spatiales composees Aggregate est soumise a une contrainte supplementaire sur le nombre minimum (fixe a 25) de composants contigus verifiant la condition d''agregation. Faire co-exister dans le meme modele des entites spatiales definies a differents niveaux offre une grande souplesse pour ecrire les methodes de dynamique de la vegetation. Certains processus seront plus facilement decrits au niveau cellulaire, d''autres au niveau agrege. Ainsi, dans cet exemple theorique simpliste, chaque cellule a une probabilite fixee (tres faible) de changer de contexte. Une dynamique d''expansion par la lisiere est ecrite (au niveau agrege) de la facon suivante: un certain nombre (correspondant au centieme du total des cellules composants l''entite forestiere) de cellules en lisiere vont etre integrees a la foret. Dans le but de garder une certaine compacite aux entites forestieres, on choisit en priorite les cellules de la lisiere qui sont entourees du plus grand nombre de cellules deja agregees. 

La seconde consiste a partir de 10 cellules graines, et a creer autant d''agregats initialement constitues  d''un seul composant: une graine. Le processus iteratif de construction des agregats repose sur l''integration, parmi les cellules en lisiere, de toutes celles qui n''appartiennent pas encore a un autre agregat.'
		        asText emphasizeAllWith: #( #bold )
]

{ #category : #description }
DemoAggregatesModel class >> howToRunIt [

	 ^ '1. Spreading of 3 forests
	 
1.1 From the Cormas main menu, load Files -> Load. Select TSE and choose SpreadForest.st version of TSE. 

1.2 Click on the first icon of the Visualisation area to open the standard spatial grid.

1.3 From the spatial grid menu, use Tools -> Load an environment, select 3forests.env and validate. This will initialize a 50*50 grid and assign values (#tree or #empty) to the cell attribute context 

1.4 Right-click within the spatial grid window to select the povTree view for Cell.

1.5 Click on the Initialize button of the Simulation area.
 
1.6 Select the initForests and stepForests: methods, then validate by clicking on Apply and close

This version builds first level Aggregates (the forests are composed of connected cells with #forest as context) and second level aggregates : a fragmented aggregate composed with first level aggregates
			        
1.7 Right-click within the spatial grid window to select the povSize view for Aggregate.  
 
1.8 Enter 30 in the Final time input field of the Simulation area 

1.9 Click on the Run button of the Simulation area

2. Swelling from 10 seeds
			         .
2.1 From the spatial grid menu, use Tools -> Load an environment, select 10seeds.env, and validate. This will initialize a 50*50 grid and assign values (true or false) to the cell attribute seed

2.2 Right-click within the spatial grid window to select the povSeed view for Cell.
 
2.3 Click on the Initialize button of the Simulation area.
	 
2.4 Select the initSeeds and stepSeeds: methods, then validate by clicking on Apply and close.  

2.5 Right-click within the spatial grid window to select the povId view for Aggregate.
 
2.6 Click on the Step button of the Simulation area.

3. Save and load your environment

3.1 From the Cormas main menu, load Files -> Load. Select TSE, and choose Save-Load-Aggregates.st version of TSE.

3.2 The init method will load a 50*50 grid and load the aggregate instances and their neighbours.

3.3 If you want to see how to save the current grid, the aggregates and their neighbours, see the exportAggregatesAndNeighbours: method. (You can also save the neighbours of the cells. It can save time when you load big irregular grid (see the exportNeighboors method).' 
]

{ #category : #testing }
DemoAggregatesModel class >> isAbstract [

	^ false
]

{ #category : #'default value' }
DemoAggregatesModel class >> seeds_default [

	^ nil
]

{ #category : #procedures }
DemoAggregatesModel >> buildForests [

	self
		deleteSpatialEntitySet: DemoAggregatesGrove;
		createAggregates: DemoAggregatesGrove
		from: DemoAggregatesPlot
		verifying: [ :arg1 | arg1 tree ]
		minimumSize: 25.
	self theGroves do: [ :arg2 | arg2 initNeighbourhood ].
	self spaceModel meanCompactness: DemoAggregatesGrove
]

{ #category : #procedures }
DemoAggregatesModel >> buildFragmentedEntitiesFromAggregates [

	self spaceModel
		setFragmentedEntities: DemoAggregatesFragmentedForest
		from: DemoAggregatesGrove
		verifying: [ :arg1 | arg1 size > 50 ]
]

{ #category : #procedures }
DemoAggregatesModel >> buildFragmentedEntitiesFromCells [

	self spaceModel
		setFragmentedEntities: DemoAggregatesFragmentedForest
		from: DemoAggregatesPlot
		verifying: #tree
]

{ #category : #procedures }
DemoAggregatesModel >> createNewAggregateWith: arg1 [

	| tmp1 |
	tmp1 := DemoAggregatesFragmentedForest newWith: arg1.
	tmp1
		id: DemoAggregatesFragmentedForest CurrentId;
		components: OrderedCollection new.
	tmp1 components addAll: arg1.
	arg1 do: [ :arg2 | 
		arg2 theCSE at: #DemoAggregatesFragmentedForest put: tmp1 ].
	(self spaceModel spatialEntities at:
		 #DemoAggregatesFragmentedForest) add: tmp1.
	tmp1 spaceModel: self spaceModel.
	self theFragmentedForests add: tmp1
]

{ #category : #procedures }
DemoAggregatesModel >> defaultDisplay [

	self
	"	openOneSpaceInterface;"
		displayPov: #povTree of: DemoAggregatesPlot;
		displayPov: #delimitors of: DemoAggregatesGrove
]

{ #category : #procedures }
DemoAggregatesModel >> exportForests [

	self spaceModel
		exportAggregateClass: DemoAggregatesGrove
		separator: $;
]

{ #category : #procedures }
DemoAggregatesModel >> exportNeighboors [

	self spaceModel
		saveNeighboorsClass: DemoAggregatesGrove
		separator: $;
]

{ #category : #seeds }
DemoAggregatesModel >> givenSeeds [

	| tmp1 |
	self seeds: OrderedCollection new.
	tmp1 := self seeds.
	tmp1
		add: self spaceModel centralLocation;
		add: self spaceModel upperRightLocation;
		add: self spaceModel upperLeftLocation;
		add: self spaceModel lowerRightLocation;
		add: self spaceModel lowerLeftLocation.
	self seeds do: [ :arg1 | arg1 seed: true ].
	^ self seeds
]

{ #category : #procedures }
DemoAggregatesModel >> importForests [

	self spaceModel
		importAggregateClass: DemoAggregatesGrove
		componentClass: DemoAggregatesPlot
		separator: $;
]

{ #category : #procedures }
DemoAggregatesModel >> importNeighboors [

	self spaceModel
		loadNeighboorsClass: DemoAggregatesGrove
		separator: $;
]

{ #category : #init }
DemoAggregatesModel >> init1FragmentedAggregate [

	self
		loadEnvironmentFromDirectory: '3forests.cells';
		buildFragmentedEntitiesFromCells;
		defaultDisplay;
		displayPov: #nil of: DemoAggregatesGrove;
		displayPov: #povId of: DemoAggregatesFragmentedForest
]

{ #category : #init }
DemoAggregatesModel >> init2AggregateLevels [

	self
		loadEnvironmentFromDirectory: '3forests.cells';
		createAggregates: DemoAggregatesGrove
		from: DemoAggregatesPlot
		verifying: [ :arg1 | arg1 tree ].
	self theGroves do: [ :arg2 | arg2 initNeighbourhood ].
	self
		createFragmentedEntities: DemoAggregatesFragmentedForest
		from: DemoAggregatesGrove
		attribute: #size;
		defaultDisplay;
		displayPov: #nil of: DemoAggregatesGrove;
		displayPov: #povId of: DemoAggregatesFragmentedForest
]

{ #category : #init }
DemoAggregatesModel >> initForests [

	self
		loadEnvironmentFromDirectory: '3forests.cells';
		buildForests;
		buildFragmentedEntitiesFromAggregates;
		defaultDisplay
]

{ #category : #seeds }
DemoAggregatesModel >> randomSeeds: arg1 [

	| tmp1 |
	self seeds: OrderedCollection new.
	[ self seeds size < arg1 ] whileTrue: [ 
		tmp1 := Cormas selectRandomlyFrom: self thePlots.
		(self seeds includes: tmp1) ifFalse: [ 
			self seeds add: tmp1.
			tmp1 seed: true ] ].
	^ self seeds
]

{ #category : #accessing }
DemoAggregatesModel >> seeds [

	^ seeds
]

{ #category : #accessing }
DemoAggregatesModel >> seeds: arg1 [

	seeds := arg1
]

{ #category : #init }
DemoAggregatesModel >> setAggregatesFifthFourth [

	self loadEnvironmentFromDirectory: '3forests.cells'.
	self
		createAggregates: DemoAggregatesGrove
		from: DemoAggregatesPlot
		horizontalDividers: 5
		verticalDividers: 4;
		defaultDisplay
]

{ #category : #init }
DemoAggregatesModel >> setAggregatesFromRandomSeeds [

	self
		loadEnvironmentFromDirectory: '3forests.cells';
		createAggregates: DemoAggregatesGrove
		fromSeeds: (self randomSeeds: 30)
		sizeDistribution: #( #( 30 80 ) );
		displayPov: #povId of: DemoAggregatesGrove;
		displayInfo: #info_surface of: DemoAggregatesGrove
]

{ #category : #init }
DemoAggregatesModel >> setSingletonAggregatesFromRandomSeeds [

	self
		loadEnvironmentFromDirectory: '3forests.cells';
		createSingletonAggregates: DemoAggregatesGrove
		fromSeeds: (self randomSeeds: 30);
		ask: DemoAggregatesGrove toDo: #setForest;
		displayPov: #povId of: DemoAggregatesGrove
]

{ #category : #control }
DemoAggregatesModel >> step2AggregateLevels: arg1 [

	self
		ask: (Cormas
				 elementsFrom: self theFragmentedForests
				 withMinValue: #minSurface)
		toDo: #swell
]

{ #category : #control }
DemoAggregatesModel >> stepForests: arg1 [

	self thePlots do: [ :arg2 | arg2 newState ].
	self theGroves do: [ :arg3 | arg3 expand ].
	self buildForests
]

{ #category : #control }
DemoAggregatesModel >> swellForests: arg1 [

	self askRandom: DemoAggregatesGrove toDo: #swell
]

{ #category : #accessing }
DemoAggregatesModel >> theCMFragmentedForests [

	| tmp1 |
	tmp1 := theFragmentedForests.
	^ tmp1
		  ifNil: [ theFragmentedForests := OrderedCollection new ]
		  ifNotNil: [ tmp1 ]
]

{ #category : #accessing }
DemoAggregatesModel >> theCMGroves [

	| tmp1 |
	tmp1 := theGroves.
	^ tmp1
		  ifNil: [ theGroves := OrderedCollection new ]
		  ifNotNil: [ tmp1 ]
]

{ #category : #accessing }
DemoAggregatesModel >> theCMPlots [

	| tmp1 |
	tmp1 := thePlots.
	^ tmp1
		  ifNil: [ thePlots := OrderedCollection new ]
		  ifNotNil: [ tmp1 ]
]

{ #category : #accessing }
DemoAggregatesModel >> theFragmentedForests [

	| tmp1 |
	tmp1 := theFragmentedForests.
	^ tmp1
		  ifNil: [ theFragmentedForests := OrderedCollection new ]
		  ifNotNil: [ tmp1 ]
]

{ #category : #accessing }
DemoAggregatesModel >> theFragmentedForests: arg1 [

	theFragmentedForests := arg1
]

{ #category : #accessing }
DemoAggregatesModel >> theGroves [

	| tmp1 |
	tmp1 := theGroves.
	^ tmp1
		  ifNil: [ theGroves := OrderedCollection new ]
		  ifNotNil: [ tmp1 ]
]

{ #category : #accessing }
DemoAggregatesModel >> theGroves: arg1 [

	theGroves := arg1
]

{ #category : #accessing }
DemoAggregatesModel >> thePlots [

	| tmp1 |
	tmp1 := thePlots.
	^ tmp1
		  ifNil: [ thePlots := OrderedCollection new ]
		  ifNotNil: [ tmp1 ]
]

{ #category : #accessing }
DemoAggregatesModel >> thePlots: arg1 [

	thePlots := arg1
]
