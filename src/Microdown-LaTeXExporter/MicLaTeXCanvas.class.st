"
I'm a specialized canvas to emit commands and latex environments.
"
Class {
	#name : #MicLaTeXCanvas,
	#superclass : #MicExportCanvas,
	#classVars : [
		'LatexCharacters'
	],
	#category : #'Microdown-LaTeXExporter'
}

{ #category : #'class initialization' }
MicLaTeXCanvas class >> initialize [
	" self initialize "
	LatexCharacters := Dictionary new.
	LatexCharacters
		at: $# put: '\#';
		at: $& put: '\&';
		at: $% put: '\%';
		at: $$ put: '\$';
		at: ${ put: '\{';
		at: $} put: '\}';
		at: $_ put: '\_';
		at: $" put: '\symbol{34}';
		" -- "
		at: $[ put: '{[}';
		at: $] put: '{]}';
		at: $| put: '\textbar{}';
		at: $< put: '\textless{}';
		at: $> put: '\textgreater{}';
		"at: $/ put: '\slash{}';"
		at: $\ put: '\textbackslash{}';
		at: $^ put: '\string^';
		" -- "
		at: $ä put: '\"{a}';
		at: $Ä put: '\"{A}';
		at: $ë put: '\"{e}';
		at: $Ë put: '\"{E}';
		at: $ï put: '\"{i}';
		at: $Ï put: '\"{I}';
		at: $ö put: '\"{o}';
		at: $Ö put: '\"{O}';
		at: $ü put: '\"{u}';
		at: $Ü put: '\"{U}';
		at: $ÿ put: '\"{y}';
		at: (Character value: 159) put: '\"{Y}';
		" -- "
		at: $â put: '\^{a}';
		at: $Â put: '\^{A}';
		at: $ê put: '\^{e}';
		at: $Ê put: '\^{E}';
		at: $î put: '\^{i}';
		at: $Î put: '\^{I}';
		at: $ô put: '\^{o}';
		at: $Ô put: '\^{O}';
		at: $û put: '\^{u}';
		at: $Û put: '\^{U}';
		" -- "
		at: $à put: '\`{a}';
		at: $À put: '\`{A}';
		at: $è put: '\`{e}';
		at: $È put: '\`{E}';
		at: $ì put: '\`{i}';
		at: $Ì put: '\`{I}';
		at: $ò put: '\`{o}';
		at: $Ò put: '\`{O}';
		at: $ù put: '\`{u}';
		at: $Ù put: '\`{U}';
		" -- "
		at: $á put: '\''{a}';
		at: $Á put: '\''{A}';
		at: $é put: '\''{e}';
		at: $í put: '\''{i}';
		at: $Í put: '\''{I}';
		at: $ó put: '\''{o}';
		at: $Ó put: '\''{O}';
		at: $ú put: '\''{u}';
		at: $Ú put: '\''{U}';
		" -- "
		at: $ç put: '\c{c}';
		at: $Ç put: '\c{C}';
		" -- "
		at: $~ put: '\textasciitilde{}';
		at: $ñ put: '\~{n}';
		at: $Ñ put: '\~{N}'
]

{ #category : #tags }
MicLaTeXCanvas >> command [
	^ self brush: MicLaTeXCommand new
]

{ #category : #tags }
MicLaTeXCanvas >> environment [
	^ self brush: MicLaTeXEnvironment new
]

{ #category : #'writing text' }
MicLaTeXCanvas >> interpretedNextPut: aCharacter [

	(LatexCharacters at: aCharacter ifAbsent: nil)
		ifNil: [ self raw: aCharacter ]
		ifNotNil: [ :string | self raw: string ]
]

{ #category : #'writing text' }
MicLaTeXCanvas >> nextPut: aCharacter [

	writingRaw 
		ifFalse: [ self interpretedNextPut: aCharacter ]
		ifTrue: [ self raw: aCharacter ]
]
