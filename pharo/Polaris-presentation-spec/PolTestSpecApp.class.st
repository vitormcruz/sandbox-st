Class {
	#name : #PolTestSpecApp,
	#superclass : #SpApplication,
	#category : #'Polaris-presentation-spec'
}

{ #category : #running }
PolTestSpecApp >> run [

	(self new: PolTestPresenter) open
]
