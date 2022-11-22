Class {
	#name : #AcTestSpecApp,
	#superclass : #SpApplication,
	#category : #'ArchCraft-presentation-spec'
}

{ #category : #running }
AcTestSpecApp >> run [

	(self new: AcTestPresenter) open
]
