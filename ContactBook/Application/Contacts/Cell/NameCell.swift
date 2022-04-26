//
//  NameCell.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class NameCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private lazy var nameInputView: BaseInputView = {
        let view = BaseInputView()
        view.textField.autocapitalizationType = .words
        view.textField.clearButtonMode = .whileEditing
        view.textField.returnKeyType = .next
        view.title = .name
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
        contentView.addSubview(nameInputView)
        nameInputView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        nameInputView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        nameInputView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        nameInputView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }
}