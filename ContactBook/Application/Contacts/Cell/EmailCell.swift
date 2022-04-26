//
//  EmailCell.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class EmailCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private lazy var emailInputView: BaseInputView = {
        let view = BaseInputView()
        view.textField.autocapitalizationType = .none
        view.textField.clearButtonMode = .whileEditing
        view.textField.keyboardType = .emailAddress
        view.textField.returnKeyType = .next
        view.title = .email
        return view
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func setupCell() {
        contentView.addSubview(emailInputView)
        emailInputView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        emailInputView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        emailInputView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        emailInputView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }
}
