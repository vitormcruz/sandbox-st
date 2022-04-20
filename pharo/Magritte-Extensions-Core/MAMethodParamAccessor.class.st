Class {
	#name : #MAMethodParamAccessor,
	#superclass : #MAAccessor,
	#instVars : [
		'selectorAccessor',
		'index'
	],
	#category : 'Magritte-Extensions-Core'
}

{ #category : #instanceCreation }
MAMethodParamAccessor class >> from: aSelectorAccessor atIndex: aNumber [ 

	aSelectorAccessor selector isUnary ifTrue: [ 
		Error signal: 'You cannot define a param for an unary message' 
	].

	[aNumber ~= 1], [ aSelectorAccessor selector isBinary ] ifAllTrue: [ 
		Error signal: 'You cannot define more than one param for a binary message' 
	].

	^ self new selectorAccessor: aSelectorAccessor; index: aNumber.
]

{ #category : #testing }
MAMethodParamAccessor class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
MAMethodParamAccessor class >> read: aReadSelector write: aWriteSelector [
	^ self new
		readSelector: aReadSelector;
		writeSelector: aWriteSelector;
		yourself
]

{ #category : #'instance creation' }
MAMethodParamAccessor class >> selector: aSelector [
	^ self new
		selector: aSelector;
		yourself
]

{ #category : #comparing }
MAMethodParamAccessor >> = anObject [
	^ selectorAccessor = anObject.
]

{ #category : #testing }
MAMethodParamAccessor >> canRead: aModel [
	^ selectorAccessor canRead: aModel.
]

{ #category : #testing }
MAMethodParamAccessor >> canWrite: aModel [
	^ selectorAccessor canWrite: aModel.
]

{ #category : #comparing }
MAMethodParamAccessor >> hash [
	^  super hash bitXor: (selectorAccessor hash)
]

{ #category : #accessors }
MAMethodParamAccessor >> index [
	^ index
]

{ #category : #accessor }
MAMethodParamAccessor >> index: anInteger [ 
	
	index := anInteger.
]

{ #category : #model }
MAMethodParamAccessor >> read: aModel [
	^ selectorAccessor read: aModel.
]

{ #category : #accessing }
MAMethodParamAccessor >> readSelector [
	^ selectorAccessor readSelector.
]

{ #category : #accessing }
MAMethodParamAccessor >> readSelector: aSelector [
	selectorAccessor readSelector: aSelector.
]

{ #category : #'accessing-dynamic' }
MAMethodParamAccessor >> selector [

	^ selectorAccessor selector.
]

{ #category : #'accessing-dynamic' }
MAMethodParamAccessor >> selector: aSelector [ 
	
	selectorAccessor selector: aSelector.
]

{ #category : #accessors }
MAMethodParamAccessor >> selectorAccessor: aMASelectorAccessor [ 

	selectorAccessor := aMASelectorAccessor.
]

{ #category : #printing }
MAMethodParamAccessor >> storeOn: aStream [
	
	selectorAccessor storeOn: aStream.
]

{ #category : #model }
MAMethodParamAccessor >> write: anObject to: aModel [

	^ selectorAccessor write: anObject to: aModel.
]

{ #category : #accessing }
MAMethodParamAccessor >> writeSelector [

	^ selectorAccessor writeSelector.
]

{ #category : #accessing }
MAMethodParamAccessor >> writeSelector: aSelector [
	selectorAccessor writeSelector: aSelector.
]
