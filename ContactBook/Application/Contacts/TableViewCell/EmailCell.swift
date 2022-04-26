//
//  EmailCell.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

protocol EmailCellDelegate {
    func didUpdateEmail(text: String)
}

class EmailCell: UITableViewCell {
    
    // MARK: - Internal properties
    
    var delegate: EmailCellDelegate?
    
    // MARK: - Private properties
    
    lazy var emailInputView: BaseInputView = {
        let view = BaseInputView()
        view.textField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
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
    
    // MARK: - Private handlers
    
    @objc private func handleTextField(textField: UITextField) {
        delegate?.didUpdateEmail(text: textField.trimmedText)
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
