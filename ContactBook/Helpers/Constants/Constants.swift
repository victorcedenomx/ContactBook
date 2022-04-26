//
//  Constants.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

struct Constants {
    struct CollectionView {
        struct Cell {
            static let id = "Cell"
            
            struct Height {
                static let contact: CGFloat = 60
            }
        }
    }
    
    struct Screen {
        static var width: CGFloat { return UIScreen.main.bounds.width }
    }
    
    struct TableView {
        struct Header {
            static let id = "Header"
        }
    }
}
