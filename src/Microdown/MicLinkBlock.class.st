"
I represent a reference in a text. For example `[http://pharo.org](http://pharo.org)` creates [http://pharo.org](http://pharo.org).
"
Class {
	#name : #MicLinkBlock,
	#superclass : #MicInlineBlockWithUrl,
	#category : #'Microdown-ModelInline'
}

{ #category : #visiting }
MicLinkBlock >> accept: aVisitor [
	^ aVisitor visitLink: self
]

{ #category : #visiting }
MicLinkBlock >> closeMe [
	
	| split args |

	split := url splitOnFirst: Character space.
	self reference: (MicResourceReference fromUri: split first).
	args := (split second ifNil: [ '' ]) trimBoth: [:char | {$". Character space} includes: char].
	self arguments: (MicArgumentList withString: args).
	self captionElements: (self inlineParse: substring).
"	self children: captionElements"
]

{ #category : #accessing }
MicLinkBlock >> fullName [
	^ self reference fullName
]

{ #category : #testing }
MicLinkBlock >> hasArguments [
	"Answer <true> if the receiver contain at least 1 argument"
	
	^ (self url trimBoth findTokens: ' ') size > 1
]

{ #category : #accessing }
MicLinkBlock >> kind [

 	^ #linkName
]

{ #category : #accessing }
MicLinkBlock >> openingDelimiter [

 	^ LinkNameOpenerMarkup
]
