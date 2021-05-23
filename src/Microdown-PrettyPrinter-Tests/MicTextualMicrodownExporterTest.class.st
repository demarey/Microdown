Class {
	#name : #MicTextualMicrodownExporterTest,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'factory',
		'visitor',
		'visitorClass',
		'parser'
	],
	#category : #'Microdown-PrettyPrinter-Tests'
}

{ #category : #tests }
MicTextualMicrodownExporterTest class >> testParameters [ 
	^ super testParameters
			addCase: { #visitorClass -> MicTextualMicrodownExporter };
		yourself.
]

{ #category : #accessing }
MicTextualMicrodownExporterTest >> factory [ 
	^ factory
]

{ #category : #accessing }
MicTextualMicrodownExporterTest >> factory: aFactory [
	factory := aFactory
]

{ #category : #running }
MicTextualMicrodownExporterTest >> setUp [
	super setUp.
	factory := MicMicroDownSnippetFactory new.
	visitor := self visitorClass new.
	parser := MicroDownParser new
]

{ #category : #'tests-anchor' }
MicTextualMicrodownExporterTest >> testAnchor [
	| micAnchor |
	micAnchor := parser parse: factory anchorSample.
	self assert: (visitor visit: micAnchor) first asString equals: parser anchorMarkup
]

{ #category : #'tests-anchor' }
MicTextualMicrodownExporterTest >> testAnchorAutomatic [

	self verifyObtain: factory anchorSample
]

{ #category : #'tests-header' }
MicTextualMicrodownExporterTest >> testHeaderWithBold [
	
	self verifyObtain: factory headerWithFormatSampleWithNewLine
]

{ #category : #'tests-header' }
MicTextualMicrodownExporterTest >> testHeaderWithNestedFormatSampleWithNewLine [

	self verifyObtain: factory headerWithNestedFormatSampleWithNewLine.

]

{ #category : #'tests-header' }
MicTextualMicrodownExporterTest >> testNestedHeader [

	| header res |
	header := parser parse: factory headerWithNestedFormatSampleWithNewLine.
	res := visitor visit: header.
	self assert: (res at: res size -1)  asString equals: parser italicMarkup.
	self assert: (res copyFrom: res size -3 to: res size - 2) equals: parser boldMarkup
]

{ #category : #'tests-header' }
MicTextualMicrodownExporterTest >> testPlainHeader [

	self verifyObtain: factory headerLevel3SampleWithNewLine 
]

{ #category : #utils }
MicTextualMicrodownExporterTest >> verifyObtain: aString [
	| micElement |
	micElement := parser parse: aString.
	self assert: (visitor visit: micElement) equals: aString
]

{ #category : #accessing }
MicTextualMicrodownExporterTest >> visitor [

	^ visitor
]

{ #category : #accessing }
MicTextualMicrodownExporterTest >> visitor: anObject [

	visitor := anObject
]

{ #category : #accessing }
MicTextualMicrodownExporterTest >> visitorClass [

	^ visitorClass
]

{ #category : #accessing }
MicTextualMicrodownExporterTest >> visitorClass: anObject [

	visitorClass := anObject
]