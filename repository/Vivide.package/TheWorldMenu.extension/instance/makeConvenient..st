*vivide-queries-override
makeConvenient: menu

	| queryMenu commandMenu |
	queryMenu := MenuMorph new defaultTarget: ActiveVivide.
	ViQueryOrganizer default globalQueries do: [:query |
		queryMenu
			add: query nextLabel
			target: ActiveVivide
			selector: #openQueryAtHand:
			argument: query.
		queryMenu lastItem icon: (query nextIcon ifNil: [ViIcons blankIcon])].
			
	commandMenu := MenuMorph new.
	ViQueryOrganizer default globalCommands do: [:command |
		commandMenu
			add: (command label ifNil: [command definition sourceCode])
			target: command
			selector: #execute.
		commandMenu lastItem icon: (command icon ifNil: [ViIcons blankIcon])].

	menu
		add: 'Global Queries' subMenu: queryMenu;
		add: 'Global Commands' subMenu: commandMenu;
		addLine.

	self
		fillIn: menu
		from: {
			{ 'Browser'. { StandardToolSet. #openClassBrowser }. 'open a browser' }.
			{ 'Workspace'. { Workspace. #open }. 'open a workspace' }.
			{ 'Transcript'. { Transcript. #open }. 'open a transcript' }.
			Smalltalk at: #TestRunner ifPresent:[:aClass|
				{ 'Test Runner'. { aClass. #open }. 'open a test runner' }.
			].
			nil
		}