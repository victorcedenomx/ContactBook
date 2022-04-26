//
//  ContactsController.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class ContactsController: BaseController {
    
    // MARK: - Private properties
    
    private lazy var contactsView = ContactsView(frame: view.frame, delegate: self)
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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

// MARK: - ContactsViewDelegate

extension ContactsController: ContactsViewDelegate {
    func didSelectContact(_ contact: Contact) {
        let contactDetailsController = ContactDetailsController()
        contactDetailsController.contact = contact
        navigationController?.pushViewController(contactDetailsController, animated: true)
    }
}
