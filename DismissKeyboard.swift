//
//  Dismiss Keyboard.swift
//  AdAstra24 Admin
//
//  Created by Sayooj Sojen on 26/02/19.
//  Copyright © 2019 teamta. All rights reserved.
//

import UIKit


extension UIViewController {
	func hideKeyboardWhenTappedAround() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
}
