//
//  PersonView.swift
//  TestTaskKarina
//
//  Created by Karina Sarkisyan on 03.10.2020.
//

import UIKit
import SDWebImage

final class PersonView: UIView {
    
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 32
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Имя отсутствует"
        return label
    }()
    private let distanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Дистанция отсутствует"
        return label
    }()
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        return stackView
    }()
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        return stackView
    }()
    private let actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(nil, for: .normal)
        return button
    }()
    
    private let tapAction: (() -> ())?
    
    
    init(action: (() -> ())? = nil) {
        self.tapAction = action
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setHorizontalStackViewConstraints()
        setAvatarImageViewConstraints()
        if tapAction != nil {
            setActionButtonConstraints()
        }
        super.updateConstraints()
    }
    
    
    func setPerson(_ person: PersonItem) {
        nameLabel.text = person.name
        distanceLabel.text = person.distance
        if let imageUrl = URL(string: person.imageUrl) {
            avatarImageView.sd_setImage(with: imageUrl)
        }
    }
    
    
    private func configureView() {
        addSubview(horizontalStackView)
        if tapAction != nil {
            addSubview(actionButton)
        }
        setupVerticalStackView()
        setupHorizontalStackView()
        setNeedsUpdateConstraints()
        
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    
    private func setupVerticalStackView() {
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(distanceLabel)
    }
    
    private func setupHorizontalStackView() {
        horizontalStackView.addArrangedSubview(avatarImageView)
        horizontalStackView.addArrangedSubview(verticalStackView)
    }
    
    private func setAvatarImageViewConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: 64),
            avatarImageView.widthAnchor.constraint(equalToConstant: 64)
        ])
    }
    
    private func setHorizontalStackViewConstraints() {
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    private func setActionButtonConstraints() {
        NSLayoutConstraint.activate([
            actionButton.topAnchor.constraint(equalTo: topAnchor),
            actionButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
    @objc private func actionButtonTapped() {
        tapAction?()
    }
    
}
