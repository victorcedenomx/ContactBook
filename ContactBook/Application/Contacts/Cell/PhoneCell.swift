//
//  PhoneCell.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class PhoneCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private lazy var phoneInputView: BaseInputView = {
        let view = BaseInputView()
        view.textField.autocapitalizationType = .none
        view.textField.clearButtonMode = .whileEditing
        view.textField.keyboardType = .phonePad
        view.textField.returnKeyType = .next
        view.title = .phone
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
        contentView.addSubview(phoneInputView)
        phoneInputView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        phoneInputView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        phoneInputView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        phoneInputView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }
}
