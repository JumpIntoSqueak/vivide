accessing - drop shadow
dropShadowRight

	^ Icons
		at: #dropShadowRight
		ifAbsentPut: [
			| result raw |
			raw := self dropShadowTopRight.
			result := Form extent: (raw width @ 1) depth: 32.
			result copy: result boundingBox from: 1@ raw height - 1 in: raw rule: Form over.
			result]