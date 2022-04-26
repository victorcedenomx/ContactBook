//
//  ContactController.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class ContactController: BaseController {
    
    // MARK: - Internal properties
    
//    var contact: Contact?
    
    // MARK: - Private properties
    
    private lazy var contactView = ContactView(frame: view.frame)
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        view.addSubview(contactView)
    }
}
