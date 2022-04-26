//
//  ContactController.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class ContactController: BaseController {
    
    // MARK: - Internal properties
    
    var contact: Contact?
    
    // MARK: - Private properties
    
    private lazy var addBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleBarButton))
    private lazy var contactView = ContactView(frame: view.frame)
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupNavigationBarTitle()
        setupView()
        setupContact()
    }
    
    @objc private func handleBarButton(barButton: UIBarButtonItem) {
        guard let emptyName = contact?.name?.isBlank, let emptyPhone = contact?.phone.isBlank, let emptyEmail = contact?.email.isBlank, !emptyName, !emptyPhone, !emptyEmail else {
            showAlert(message: .pleaseFillAllGeneralFields, acceptText: .accept)
            return
        }
        
        if let contact = contact {
            Contact.createContact(contact)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Private functions
    
    private func setupContact() {
        if contact == nil {
            contact = Contact(context: CoreDataManager.sharedInstance.context)
        }
        
        contactView.contact = contact
    }
    
    private func setupView() {
        view.addSubview(contactView)
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = addBarButton
    }
    
    private func setupNavigationBarTitle() {
        navigationItem.title = contact == nil ? .addContact : .editContact
    }
}
