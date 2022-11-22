Class {
	#name : #AcTestPresenter,
	#superclass : #SpPresenter,
	#category : #'ArchCraft-presentation-spec'
}

{ #category : #layout }
AcTestPresenter class >> defaultLayout [
	
	^ SpBoxLayout newTopToBottom. 
]

{ #category : #initialization }
AcTestPresenter >> initializePresenters [

	self layout add: 'Project Name:' expand: false;
					add: (self newTextInput).
]
