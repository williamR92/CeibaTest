//
//  AlertView.swift
//  testCeibaWilliam
//
//  Created by Desarrollo MAC on 11/5/22.
//

import UIKit

class Alert: NSObject {

    class func Warning(delegate: UIViewController, message: String) {
        let alert = UIAlertController(title: "CEIBA TEST", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        delegate.present(alert, animated: true, completion: nil)
    }

}
