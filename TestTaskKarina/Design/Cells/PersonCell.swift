//
//  PersonCell.swift
//  TestTaskKarina
//
//  Created by Karina Sarkisyan on 03.10.2020.
//

import UIKit

final class PersonCell: UITableViewCell {
    
    
    static let identifier = "PersonCell"
    
    private let personView: PersonView = {
        let view = PersonView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setPersonViewConstraints()
        super.updateConstraints()
    }
    
    
    func setPersonItem(_ personItem: PersonItem) {
        self.personView.setPerson(personItem)
    }
    
    
    private func setPersonViewConstraints() {
        NSLayoutConstraint.activate([
            personView.topAnchor.constraint(equalTo: topAnchor),
            personView.bottomAnchor.constraint(equalTo: bottomAnchor),
            personView.leadingAnchor.constraint(equalTo: leadingAnchor),
            personView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func configureCell() {
        contentView.addSubview(personView)
        setNeedsUpdateConstraints()
    }
    
    
}
