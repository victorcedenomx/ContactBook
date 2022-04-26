//
//  BaseController.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class BaseController: UIViewController {
    
    // MARK: - Internal properties
    
    var navigationTitle: String? {
        return nil
    }
    
    // MARK: - Private properties
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let tg = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        tg.cancelsTouchesInView = false
        return tg
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackBarButton()
        setupNavigationBarTitle()
        setupTapGesture()
        setupView()
    }
    
    // MARK: - Private event handlers
    
    @objc private func handleTapGesture() {
        view.endEditing(true)
    }
    
    // MARK: - Private functions
    
    private func setupBackBarButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setupNavigationBarTitle() {
        navigationItem.title = navigationTitle
    }
    
    private func setupTapGesture() {
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
    }
}
