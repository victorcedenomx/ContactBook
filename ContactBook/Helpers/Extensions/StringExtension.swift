//
//  StringExtension.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import Foundation

extension String {
    
    // MARK: - Additional functions
    
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
