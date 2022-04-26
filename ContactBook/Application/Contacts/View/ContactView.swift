//
//  ContactView.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class ContactView: BaseView {
    
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
                return cell
            case 1:
                let cell = PhoneCell()
                return cell
            default:
                let cell = EmailCell()
                return cell
            }
        case 1:
            let cell = AddressCell()
            return cell
        default:
            let cell = NotesCell()
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
        return indexPath.section == 2 ? 100 : 60
    }
}
