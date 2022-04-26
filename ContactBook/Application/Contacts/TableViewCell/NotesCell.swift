//
//  NotesCell.swift
//  ContactBook
//
//  Created by Víctor Cedeño on 26/04/22.
//

import UIKit

protocol NotesCellDelegate {
    func didUpdateNotes(text: String)
}

class NotesCell: UITableViewCell {
    
    // MARK: - Internal properties
    
    var delegate: NotesCellDelegate?
    
    // MARK: - Private properties
    
    lazy var notesTextView: UITextView = {
        let tv = UITextView()
        tv.delegate = self
        tv.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        tv.layer.borderWidth = 0.5
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    // MARK: - Initializers
    
    convenience init(frame: CGRect, delegate: NotesCellDelegate?) {
        self.init(frame: frame)
        self.delegate = delegate
    }
    
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

// MARK: - Private functions

extension NotesCell: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        delegate?.didUpdateNotes(text: textView.trimmedText)
    }
}
