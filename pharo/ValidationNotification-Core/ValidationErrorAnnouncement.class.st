Class {
	#name : #ValidationErrorAnnouncement,
	#superclass : #ValidationAnnouncement,
	#instVars : [
		'issuer',
		'context',
		'errorMessage'
	],
	#category : 'ValidationNotification-Core'
}

{ #category : #'instance creation' }
ValidationErrorAnnouncement class >> newForError: aString issuedBy: anObject withinContext: context [

	^ self new forError: aString issuedBy: anObject withinContext: context.
]

{ #category : #converting }
ValidationErrorAnnouncement >> asValidationErrorRow [

	^ {errorMessage. issuer. context.}.
]

{ #category : #accessing }
ValidationErrorAnnouncement >> context [
	^ context
]

{ #category : #accessing }
ValidationErrorAnnouncement >> errorMessage [
	^ errorMessage
]

{ #category : #'instance creation' }
ValidationErrorAnnouncement >> forError: aString issuedBy: anObject withinContext: aContext [

	errorMessage := aString.
	issuer := anObject.
	context := aContext.
	
]

{ #category : #accessing }
ValidationErrorAnnouncement >> issuer [
	^ issuer
]
