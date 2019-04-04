//
//  FixImageRotation.swift
//  24Studios-admin
//
//  Created by Sayooj Sojen on 28/02/19.
//  Copyright © 2019 teamta. All rights reserved.
//

import UIKit

extension UIImage {
	
	func byFixingOrientation(andResizingImageToNewSize newSize: CGSize? = nil) -> UIImage {
		
		guard let cgImage = self.cgImage else { return self }
		
		let orientation = self.imageOrientation
		guard orientation != .up else { return UIImage(cgImage: cgImage, scale: 1, orientation: .up) }
		
		var transform = CGAffineTransform.identity
		let size = newSize ?? self.size
		
		if (orientation == .down || orientation == .downMirrored) {
			transform = transform.translatedBy(x: size.width, y: size.height)
			transform = transform.rotated(by: .pi)
		}
		else if (orientation == .left || orientation == .leftMirrored) {
			transform = transform.translatedBy(x: size.width, y: 0)
			transform = transform.rotated(by: CGFloat.pi / 2)
		}
		else if (orientation == .right || orientation == .rightMirrored) {
			transform = transform.translatedBy(x: 0, y: size.height)
			transform = transform.rotated(by: -(CGFloat.pi / 2))
		}
		
		if (orientation == .upMirrored || orientation == .downMirrored) {
			transform = transform.translatedBy(x: size.width, y: 0);
			transform = transform.scaledBy(x: -1, y: 1)
		}
		else if (orientation == .leftMirrored || orientation == .rightMirrored) {
			transform = transform.translatedBy(x: size.height, y: 0)
			transform = transform.scaledBy(x: -1, y: 1)
		}
		
		// Now we draw the underlying CGImage into a new context, applying the transform calculated above.
		guard let ctx = CGContext(data: nil, width: Int(size.width), height: Int(size.height),
								  bitsPerComponent: cgImage.bitsPerComponent, bytesPerRow: 0,
								  space: cgImage.colorSpace!, bitmapInfo: cgImage.bitmapInfo.rawValue)
			else {
				return UIImage(cgImage: cgImage, scale: 1, orientation: orientation)
		}
		
		ctx.concatenate(transform)
		
		// Create a new UIImage from the drawing context
		switch (orientation) {
		case .left, .leftMirrored, .right, .rightMirrored:
			ctx.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))
		default:
			ctx.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
		}
		
		return UIImage(cgImage: ctx.makeImage() ?? cgImage, scale: 1, orientation: .up)
	}
}

