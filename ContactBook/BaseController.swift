//
//  BaseController.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class BaseController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        view.backgroundColor = .systemBackground
    }
}
