//
//  MenuView.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

protocol MenuViewDelegate {
    func didTapShowContacts()
}

class MenuView: BaseView {
    
    // MARK: - Private properties
    
    private lazy var contactsButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        btn.setTitle(.showContacts, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private var delegate: MenuViewDelegate?
    
    // MARK: - Initializers
    
    convenience init(frame: CGRect, delegate: MenuViewDelegate?) {
        self.init(frame: frame)
        self.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private handlers
    
    @objc private func handleButton(button: UIButton) {
        delegate?.didTapShowContacts()
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        addSubview(contactsButton)
        contactsButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contactsButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        contactsButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
    }
}
