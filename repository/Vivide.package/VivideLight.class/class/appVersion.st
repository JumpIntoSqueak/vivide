as yet unclassified
appVersion

	^ (Smalltalk at: #ConfigurationOfVivide ifAbsent: [])
		ifNotNil: [:conf | [conf project currentVersion] on: Error do: []]