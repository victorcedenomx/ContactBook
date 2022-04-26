//
//  ContactView.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class ContactView: BaseView {
    
    // MARK: - Internal properties
    
    var contact: Contact?
    
    // MARK: - Private properties
    
    private lazy var contactTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.allowsSelection = false
        tv.backgroundColor = .systemBackground
        tv.dataSource = self
        tv.delegate = self
        tv.separatorStyle = .none
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    // MARK: - Initializers
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        addSubview(contactTableView)
        contactTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        contactTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        contactTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        contactTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

// MARK: - AddressCellDelegate

extension ContactView: AddressCellDelegate {
    func didUpdateAddressLine1(text: String) {
        contact?.addressLine1 = text
    }
    
    func didUpdateZipCode(text: String) {
        contact?.zipCode = text
    }
    
    func didUpdateCity(text: String) {
        contact?.city = text
    }
    
    func didUpdateState(text: String) {
        contact?.state = text
    }
}

// MARK: - EmailCellDelegate

extension ContactView: EmailCellDelegate {
    func didUpdateEmail(text: String) {
        contact?.email = text
    }
}

// MARK: - NameCellDelegate

extension ContactView: NameCellDelegate {
    func didUpdateName(text: String) {
        contact?.name = text
    }
}

// MARK: - NotesCellDelegate

extension ContactView: NotesCellDelegate {
    func didUpdateNotes(text: String) {
        contact?.notes = text
    }
}

// MARK: - PhoneCellDelegate

extension ContactView: PhoneCellDelegate {
    func didUpdatePhone(text: String) {
        contact?.phone = text
    }
}

// MARK: - UITableViewDataSource

extension ContactView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = NameCell()
                cell.delegate = self
                cell.nameInputView.textField.text = contact?.name
                return cell
            case 1:
                let cell = PhoneCell()
                cell.delegate = self
                cell.phoneInputView.textField.text = contact?.phone
                return cell
            default:
                let cell = EmailCell()
                cell.delegate = self
                cell.emailInputView.textField.text = contact?.email
                return cell
            }
        case 1:
            let cell = AddressCell()
            cell.delegate = self
            cell.addressLine1InputView.textField.text = contact?.addressLine1
            return cell
        default:
            let cell = NotesCell()
            cell.delegate = self
            cell.notesTextView.text = contact?.notes
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return .general
        case 1:
            return .address
        default:
            return .notes
        }
    }
}

// MARK: - UITableViewDataSource

extension ContactView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 60
        case 1:
            return 240
        default:
            return 100
        }
    }
}
