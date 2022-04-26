//
//  AddressCell.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class AddressCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private lazy var addressLine1InputView: BaseInputView = {
        let view = BaseInputView()
        view.textField.autocapitalizationType = .sentences
        view.textField.clearButtonMode = .whileEditing
        view.textField.returnKeyType = .next
        view.title = .address
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
        contentView.addSubview(addressLine1InputView)
        addressLine1InputView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        addressLine1InputView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        addressLine1InputView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        addressLine1InputView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }
}
