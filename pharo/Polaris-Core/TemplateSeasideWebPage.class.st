Class {
	#name : #TemplateSeasideWebPage,
	#superclass : #MDLApplication,
	#category : #'Polaris-Core-NewCode-Template-Seaside'
}

{ #category : #initialization }
TemplateSeasideWebPage class >> register_me_as_root_on_server [

	WAAdmin unregister: 'welcome'.
	self registerToDevelopment: '<projectName>'.
]

{ #category : #rendering }
TemplateSeasideWebPage >> aboutInfoFor: html [

	html mdlNavigationLink id: 'aboutLink'; 
								  url: '#'; 
					  		     with: 'About'.

	html mdlDialog	
		  openButtonId: 'aboutLink';
  		  with: [ 
		  		html mdlDialogTitle: 'Your Title Here'.
			 	html mdlDialogContent: [ html paragraph: 'Dialog Content' ] 
		  ]
]

{ #category : #initialization }
TemplateSeasideWebPage >> initialize [

	super initialize.
	self primaryColor: MDLColor blue secondaryColor: MDLColor green.
]

{ #category : #rendering }
TemplateSeasideWebPage >> renderContentOn: html [

	html mdlLayout fixedHeader; with: [ 
		
		html mdlLayoutHeader: [ 
			html mdlLayoutHeaderRow: [ 
				html mdlLayoutTitle: [ html mdlNavigationLink id: 'layoutTitle'; url: '/'; with: '<projectName>' ].
				html mdlLayoutSpacer.
				html mdlNavigation: [ 
					self aboutInfoFor: html.
				].
			] 
		].
	
	]
]

{ #category : #accessing }
TemplateSeasideWebPage >> style [
	^ '

.mdl-pagination__current{
	box-shadow: inset 0px -4px 0px 0px #69F0AE !!important;
}

#payrollLayoutTitle{
	font-size: 130%;
}
	
'
]

{ #category : #updating }
TemplateSeasideWebPage >> updateRoot: anHtmlRoot [

    super updateRoot: anHtmlRoot.
    anHtmlRoot title: '<projectTitle>'.
]
