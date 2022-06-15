Class {
	#name : #MicIntoDocumentBrowserCommand,
	#superclass : #MicNavigationDocumentBrowserCommand,
	#category : #'Microdown-DocumentBrowser-GUI'
}

{ #category : #default }
MicIntoDocumentBrowserCommand class >> defaultShortcutKey [

	^ $i alt
]

{ #category : #executing }
MicIntoDocumentBrowserCommand >> execute [
	list selectPath: path, #(1).
	list selection selectedItem ifNil: [ list selectPath: path ].
]

{ #category : #initialization }
MicIntoDocumentBrowserCommand >> initialize [

	super initialize.
	self
		name: 'Into';
		description: 'Into tree'
]