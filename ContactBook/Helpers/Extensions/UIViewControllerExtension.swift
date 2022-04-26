//
//  UIViewControllerExtension.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

extension UIViewController {
    
    // MARK: - Additional functions
    
    func showAlert(title: String? = nil, message: String?, acceptText: String, cancelText: String? = nil, isAsync: Bool = false, style: UIAlertController.Style = .alert, acceptHandler: ((UIAlertAction) -> Void)? = nil, cancelHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        if let cancelText = cancelText, !cancelText.isEmpty {
            alert.addAction(UIAlertAction(title: cancelText, style: .cancel, handler: cancelHandler))
        }
        
        alert.addAction(UIAlertAction(title: acceptText, style: .default, handler: acceptHandler))
        alert.popoverPresentationController?.sourceView = view
        
        if isAsync {
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
