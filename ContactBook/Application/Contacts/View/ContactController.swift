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
    var saveContact = false
    
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        deleteTemporaryContact()
    }
    
    @objc private func handleBarButton(barButton: UIBarButtonItem) {
        guard let emptyName = contact?.name?.isBlank, let emptyPhone = contact?.phone.isBlank, let emptyEmail = contact?.email.isBlank, !emptyName, !emptyPhone, !emptyEmail else {
            showAlert(message: .pleaseFillAllGeneralFields, acceptText: .accept)
            return
        }
        
        saveContact = true
        
        if let contact = contact {
            Contact.createContact(contact)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Private functions
    
    private func deleteTemporaryContact() {
        if !saveContact {
            guard let contact = contact else {
                return
            }
            
            Contact.deleteContact(contact)
        }
    }
    
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
        navigationItem.hidesBackButton = contact != nil
        navigationItem.title = contact == nil ? .addContact : .editContact
    }
}
