//
//  ContactCell.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class ContactCell: UICollectionViewCell {
    
    // MARK: - Internal properties
    
    var contact: Contact? {
        didSet {
            guard let contact = contact else { return }
            setupContact(with: contact)
        }
    }
    
    // MARK: - Private properties
    
    private let letterView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let letterLabel: UILabel = {
        let lbl = UILabel()
        lbl.baselineAdjustment = .alignCenters
        lbl.font = .systemFont(ofSize: 20, weight: .bold)
        lbl.textAlignment = .center
        lbl.textColor = .secondaryLabel
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.baselineAdjustment = .alignCenters
        lbl.font = .systemFont(ofSize: 15, weight: .semibold)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let phoneLabel: UILabel = {
        let lbl = UILabel()
        lbl.baselineAdjustment = .alignCenters
        lbl.font = .systemFont(ofSize: 13, weight: .regular)
        lbl.textAlignment = .left
        lbl.textColor = .secondaryLabel
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let emailLabel: UILabel = {
        let lbl = UILabel()
        lbl.baselineAdjustment = .alignCenters
        lbl.font = .systemFont(ofSize: 13, weight: .regular)
        lbl.textAlignment = .left
        lbl.textColor = .secondaryLabel
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    // MARK: - Overrides
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                setupShadow()
            }
        }
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell(frame: frame)
        setupShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func setupContact(with contact: Contact) {
        letterLabel.text = contact.name?.first?.uppercased()
        nameLabel.text = contact.name
        phoneLabel.text = contact.phone
        emailLabel.text = contact.email
    }
    
    private func setupCell(frame: CGRect) {
        let width = frame.width
        let height = frame.height
        let horizontalMargin = width * 0.05
        let verticalMargin = height * 0.1
        let avatarViewSize = height * 0.75
        
        backgroundColor = .systemBackground
        layer.cornerRadius = 5
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.5
        
        addSubview(letterView)
        letterView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        letterView.leftAnchor.constraint(equalTo: leftAnchor, constant: horizontalMargin).isActive = true
        letterView.widthAnchor.constraint(equalToConstant: avatarViewSize).isActive = true
        letterView.heightAnchor.constraint(equalToConstant: avatarViewSize).isActive = true
        letterView.layer.cornerRadius = avatarViewSize / 2
        
        addSubview(letterLabel)
        letterLabel.centerXAnchor.constraint(equalTo: letterView.centerXAnchor).isActive = true
        letterLabel.centerYAnchor.constraint(equalTo: letterView.centerYAnchor).isActive = true
        letterLabel.widthAnchor.constraint(equalToConstant: avatarViewSize).isActive = true
        letterLabel.heightAnchor.constraint(equalToConstant: avatarViewSize).isActive = true

        addSubview(nameLabel)
        nameLabel.bottomAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: letterView.rightAnchor, constant: horizontalMargin).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -horizontalMargin).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        addSubview(phoneLabel)
        phoneLabel.topAnchor.constraint(equalTo: centerYAnchor).isActive = true
        phoneLabel.leftAnchor.constraint(equalTo: letterView.rightAnchor, constant: horizontalMargin).isActive = true
        phoneLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -horizontalMargin).isActive = true
        phoneLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
    }
    
    private func setupShadow() {
        layer.shadowColor = UIColor.label.cgColor
        letterView.layer.shadowColor = UIColor.label.cgColor
    }
}
