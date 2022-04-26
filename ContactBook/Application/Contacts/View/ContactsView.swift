//
//  ContactsView.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

protocol ContactsViewDelegate {
    func didSelectContact(_ contact: Contact)
}

class ContactsView: BaseView {
    
    // MARK: - Internal functions
    
    var contacts: [Contact] = [] {
        didSet {
            contactsCollectionView.isEmptyMessageHidden = !contacts.isEmpty
            contactsCollectionView.reloadData()
        }
    }
    
    lazy var contactsCollectionView: BaseCollectionView = {
        let topBottomInset: CGFloat = 10
        let leftRightInset: CGFloat = 0
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 25
        layout.sectionInset = UIEdgeInsets(top: topBottomInset, left: leftRightInset, bottom: topBottomInset, right: leftRightInset)
        
        let cv = BaseCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.dataSource = self
        cv.delegate = self
        cv.emptyMessage = .goToMainMenuToStartAddingContacts
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private var delegate: ContactsViewDelegate?
    
    // MARK: - Initializers
    
    convenience init(frame: CGRect, delegate: ContactsViewDelegate?) {
        self.init(frame: frame)
        self.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        registerCollectionViewClass()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        addSubview(contactsCollectionView)
        contactsCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        contactsCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        contactsCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        contactsCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func registerCollectionViewClass() {
        contactsCollectionView.register(ContactCell.self, forCellWithReuseIdentifier: Constants.CollectionView.Cell.id)
    }
}

// MARK: - UICollectionViewDataSource

extension ContactsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionView.Cell.id, for: indexPath) as! ContactCell
        let contact = contacts[indexPath.item]
        cell.contact = contact
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension ContactsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let contact = contacts[indexPath.item]
        delegate?.didSelectContact(contact)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ContactsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Constants.Screen.width * 0.9
        let height = Constants.CollectionView.Cell.Height.contact
        return CGSize(width: width, height: height)
    }
}
