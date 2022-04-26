//
//  UITextViewExtension.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

extension UITextView {
    
    // MARK: - Additional properties
    
    var trimmedText: String {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    }
}
