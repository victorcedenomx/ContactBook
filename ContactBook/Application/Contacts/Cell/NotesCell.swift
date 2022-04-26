//
//  NotesCell.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

class NotesCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private lazy var notesTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
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
        contentView.addSubview(notesTextView)
        notesTextView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        notesTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        notesTextView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        notesTextView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }
}
