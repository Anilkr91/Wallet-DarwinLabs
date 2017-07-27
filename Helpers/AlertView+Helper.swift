//
//  AlertView+Helper.swift
//
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit
import Gloss

class Alert {
    
//     let alertView = UIApplication.shared.windows[0].rootViewController
    
    class func showAlertWithError(title: String ,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action: UIAlertAction!) in
        }))
        
        UIApplication.shared.windows[0].rootViewController!.present(alert, animated: true, completion: nil)
    }
}
