Class {
	#name : #PolTestPresenter,
	#superclass : #SpPresenter,
	#category : #'Polaris-presentation-spec'
}

{ #category : #layout }
PolTestPresenter class >> defaultLayout [
	
	^ SpBoxLayout newTopToBottom. 
]

{ #category : #initialization }
PolTestPresenter >> initializePresenters [

	self layout add: 'Project Name:' expand: false;
					add: (self newTextInput).
]
