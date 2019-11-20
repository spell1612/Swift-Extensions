
//
//  ImageEncode.swift
//  AdAstra24 Admin
//
//  Created by Sayooj Sojen on 20/02/19.
//  Copyright © 2019 teamta. All rights reserved.
//

import UIKit


extension UIImage {
	func toBase64() -> String? {
		guard let imageData = self.jpegData(compressionQuality: 0.4) else { return nil }
		return imageData.base64EncodedString()
	}
	
}
