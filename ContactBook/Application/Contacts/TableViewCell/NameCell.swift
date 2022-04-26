//
//  NameCell.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

protocol NameCellDelegate {
    func didUpdateName(text: String)
}

class NameCell: UITableViewCell {
    
    // MARK: - Internal properties
    
    var delegate: NameCellDelegate?
    
    // MARK: - Private properties
    
    lazy var nameInputView: BaseInputView = {
        let view = BaseInputView()
        view.textField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
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
    
    // MARK: - Private handlers
    
    @objc private func handleTextField(textField: UITextField) {
        delegate?.didUpdateName(text: textField.trimmedText)
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
