//
//  ContactDetailsController.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class ContactDetailsController: BaseController {
    
    // MARK: - Internal properties
    
    var contact: Contact?
    var contactId: Int64?
    
    // MARK: - Private properties
    
    private lazy var editBarButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(handleBarButton))
    private lazy var contactDetailsView = ContactDetailsView(frame: view.frame)
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupContact()
    }
    
    // MARK: - Private handlers
    
    @objc private func handleBarButton(barButton: UIBarButtonItem) {
        let contactController = ContactController()
        contactController.contact = contact
        navigationController?.pushViewController(contactController, animated: true)
    }
    
    // MARK: - Private functions
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = editBarButton
    }
    
    private func setupView() {
        view.addSubview(contactDetailsView)
    }
    
    private func setupContact() {
        contactDetailsView.contact = contact
    }
}
