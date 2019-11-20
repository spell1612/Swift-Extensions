//
//  PopUpError.swift
//  scantext
//
//  Created by Sayooj Sojen on 17/05/19.
//  Copyright © 2019 Travancore Analytics. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func popUpError(withMessage err: String){
        
        let alert = UIAlertController(title: "Alert", message: err, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}
