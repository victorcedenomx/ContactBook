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
    
    // MARK: - Overrides
    
    override var navigationTitle: String? {
        return .contacts
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        contactsView.contactsCollectionView.reloadData()
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupContacts()
    }
    
    // MARK: - Private functions
    
    private func setupContacts() {
        contactsView.contacts = Contact.getAllContacts()
    }
    
    private func setupView() {
        view.addSubview(contactsView)
    }
}
