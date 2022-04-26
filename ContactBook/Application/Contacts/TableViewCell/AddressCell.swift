//
//  AddressCell.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

protocol AddressCellDelegate {
    func didUpdateAddressLine1(text: String)
    func didUpdateZipCode(text: String)
    func didUpdateCity(text: String)
    func didUpdateState(text: String)
}

class AddressCell: UITableViewCell {
    
    // MARK: - Internal properties
    
    var delegate: AddressCellDelegate?
    
    // MARK: - Private properties
    
    lazy var addressLine1InputView: BaseInputView = {
        let view = BaseInputView()
        view.textField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        view.textField.autocapitalizationType = .sentences
        view.textField.clearButtonMode = .whileEditing
        view.textField.returnKeyType = .next
        view.title = .addressLine1
        return view
    }()
    
    lazy var zipCodeInputView: BaseInputView = {
        let view = BaseInputView()
        view.textField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        view.textField.autocapitalizationType = .sentences
        view.textField.clearButtonMode = .whileEditing
        view.textField.returnKeyType = .next
        view.title = .zipCode
        return view
    }()
    
    lazy var cityInputView: BaseInputView = {
        let view = BaseInputView()
        view.textField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        view.textField.autocapitalizationType = .sentences
        view.textField.clearButtonMode = .whileEditing
        view.textField.returnKeyType = .next
        view.title = .city
        return view
    }()
    
    lazy var stateInputView: BaseInputView = {
        let view = BaseInputView()
        view.textField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        view.textField.autocapitalizationType = .sentences
        view.textField.clearButtonMode = .whileEditing
        view.textField.returnKeyType = .next
        view.title = .state
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
        switch textField {
        case addressLine1InputView.textField:
            delegate?.didUpdateAddressLine1(text: textField.trimmedText)
        case zipCodeInputView.textField:
            delegate?.didUpdateZipCode(text: textField.trimmedText)
        case cityInputView.textField:
            delegate?.didUpdateCity(text: textField.trimmedText)
        case stateInputView.textField:
            delegate?.didUpdateState(text: textField.trimmedText)
        default:
            break
        }
    }
    
    // MARK: - Private functions
    
    private func setupCell() {
        contentView.addSubview(addressLine1InputView)
        addressLine1InputView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        addressLine1InputView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        addressLine1InputView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        addressLine1InputView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        contentView.addSubview(zipCodeInputView)
        zipCodeInputView.topAnchor.constraint(equalTo: addressLine1InputView.bottomAnchor).isActive = true
        zipCodeInputView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        zipCodeInputView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        zipCodeInputView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        contentView.addSubview(cityInputView)
        cityInputView.topAnchor.constraint(equalTo: zipCodeInputView.bottomAnchor).isActive = true
        cityInputView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        cityInputView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        cityInputView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        contentView.addSubview(stateInputView)
        stateInputView.topAnchor.constraint(equalTo: cityInputView.bottomAnchor).isActive = true
        stateInputView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stateInputView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        stateInputView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }
}
