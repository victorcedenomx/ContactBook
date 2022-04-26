//
//  ViewController.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class MenuController: BaseController {
    
    // MARK: - Private properties
    
    private lazy var addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleBarButton))
    private lazy var menuView = MenuView(frame: view.frame, delegate: self)
    
    // MARK: - Overrides
    
    override var navigationTitle: String? {
        return .menu
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
    }
    
    @objc private func handleBarButton(barButton: UIBarButtonItem) {
        navigationController?.pushViewController(ContactController(), animated: true)
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        view.addSubview(menuView)
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = addBarButton
    }
}

// MARK: - MenuViewDelegate

extension MenuController: MenuViewDelegate {
    func didTapShowContacts() {
        navigationController?.pushViewController(ContactsController(), animated: true)
    }
}
