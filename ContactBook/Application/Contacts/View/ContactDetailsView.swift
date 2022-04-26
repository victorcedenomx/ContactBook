//
//  ContactDetailsView.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class ContactDetailsView: BaseView {
    
    // MARK: - Internal properties
    
    var contact: Contact? {
        didSet {
            contactTableView.reloadData()
        }
    }
    
    // MARK: - Private properties
    
    private lazy var contactTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.allowsSelection = false
        tv.backgroundColor = .clear
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

// MARK: - UITableViewDataSource

extension ContactDetailsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = PhoneCell()
            cell.phoneInputView.textField.isEnabled = false
            cell.phoneInputView.textField.text = contact?.phone
            cell.phoneInputView.textField.textColor = .defaultBlue
            return cell
        default:
            let cell = EmailCell()
            cell.emailInputView.textField.isEnabled = false
            cell.emailInputView.textField.text = contact?.email
            cell.emailInputView.textField.textColor = .defaultBlue
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension ContactDetailsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ContactSummaryHeader()
        header.nameLabel.text = contact?.name
        return header
    }
}
