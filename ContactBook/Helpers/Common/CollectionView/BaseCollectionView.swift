//
//  BaseCollectionView.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class BaseCollectionView: UICollectionView {
    
    // MARK: Internal properties
    
    var isEmptyMessageHidden: Bool? {
        didSet {
            messageLabel.isHidden = isEmptyMessageHidden ?? true
        }
    }
    
    var emptyMessage: String? {
        didSet {
            messageLabel.text = emptyMessage
        }
    }
    
    // MARK: Private properties
    
    private let messageLabel: UILabel = {
        let lbl = UILabel()
        lbl.baselineAdjustment = .alignCenters
        lbl.font = .systemFont(ofSize: 20, weight: .bold)
        lbl.isHidden = true
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.textColor = UIColor.secondaryLabel.withAlphaComponent(0.5)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func setupView() {
        addSubview(messageLabel)
        messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        messageLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        messageLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
}
