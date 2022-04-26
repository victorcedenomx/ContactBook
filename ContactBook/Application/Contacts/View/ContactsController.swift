//
//  ContactsController.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class ContactsController: BaseController {
    
    // MARK: - Private properties
    
    private lazy var contactsView = ContactsView(frame: view.frame)
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        view.addSubview(contactsView)
    }
}
