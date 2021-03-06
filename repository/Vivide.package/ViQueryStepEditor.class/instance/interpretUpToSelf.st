as yet unclassified
interpretUpToSelf

	| input |
	self updateContext.

	otherSteps overlappingPairsDo: [:s1 :s2 |
		s1 next == s2 ifFalse: [
			self warningSent: 'Some steps are not connected. Fix that first.'.
			^ nil]].
	
	"Collect all objects above the first step in the list."
	input := Array streamContents: [:stream |
		self context detect: [:obj |
			(obj isKindOf: ViQueryStep)
				ifTrue: [true]
				ifFalse: [stream nextPut: obj. false]]].
	
	^ (ViQueryInterpreter on: (ViQueryStep use: input in: otherSteps first))
		upToStep: self object;
		yourself