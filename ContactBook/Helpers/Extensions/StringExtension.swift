//
//  StringExtension.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import Foundation

extension String {
    
    // MARK: - Additional properties
    
    var isBlank: Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines) == ""
    }
    
    // MARK: - Additional functions
    
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}

extension Optional where Wrapped == String {
    
    // MARK: - Additional properties
    
    var isBlank: Bool {
        return self?.isBlank ?? true
    }
}
