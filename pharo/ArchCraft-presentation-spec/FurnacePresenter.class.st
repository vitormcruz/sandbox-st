Class {
	#name : #FurnacePresenter,
	#superclass : #SpPresenter,
	#category : #'ArchCraft-presentation-spec'
}

{ #category : #layout }
FurnacePresenter class >> defaultLayout [
	
	^ SpBoxLayout newTopToBottom. 
]

{ #category : #initialization }
FurnacePresenter >> initializePresenters [

	self layout add: 'Project Name:' expand: false;
					add: (self newTextInput).
]
