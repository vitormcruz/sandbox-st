as yet unclassified
onValidationError: aBlockClosure

	self isValidationSuccessful ifFalse: [aBlockClosure cull: self errorArray].

