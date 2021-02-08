//
//  UIAlertController+Utility.swift
//  Hoopla
//
//  Created by Scor Doan on 07/02/2021.
//

import Foundation
import UIKit

//MARK: - UIAlertViewController
extension UIAlertController {
    
    static func okAlertWithTitle(_ title: String, message: String?, okTapped: (()->Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
            okTapped?()
        }))
        return alertController
    }
    
    static func presentOKAlertWithTitle(_ title: String, message: String?, okTapped: (()->Void)? = nil) {
        let alertController = UIAlertController.okAlertWithTitle(title, message: message, okTapped: okTapped)
        UIViewController.topMostController().present(alertController, animated: true, completion: nil)
    }
    
}
