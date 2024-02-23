// StoryView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let imageSize: CGFloat = 60
    static let plusButtonSize: CGFloat = 20
    static let defaultText = "Ваша история"
    static let fontVerdana = "Verdana"
    static let plusBackgroundColor = "plusBackground"
}

/// Данный класс отрисовывает каждую вью в ленте
final class StoryView: UIView {
    // MARK: - Private Properties

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: Constants.fontVerdana, size: 10)
        return label
    }()

    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var plusButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(named: Constants.plusBackgroundColor)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.isHidden = true
        button.titleLabel?.font = UIFont(name: Constants.fontVerdana, size: 12)
        return button
    }()

    // MARK: -

    override func didMoveToSuperview() {
        setupSubview()
    }

    // MARK: - Private Methods

    private func setupSubview() {
        addSubviews(nameLabel, userImageView, plusButton)
        setupConstraints()
    }
}

// MARK: - Set constraints

private extension StoryView {
    func setupConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        plusButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            userImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            userImageView.heightAnchor.constraint(equalToConstant: 60),
            userImageView.widthAnchor.constraint(equalToConstant: 60),

            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            nameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 2),
            nameLabel.trailingAnchor.constraint(equalTo: userImageView.trailingAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: frame.width),

            plusButton.trailingAnchor.constraint(equalTo: userImageView.trailingAnchor),
            plusButton.bottomAnchor.constraint(equalTo: userImageView.bottomAnchor),
            plusButton.heightAnchor.constraint(equalToConstant: Constants.plusButtonSize),
            plusButton.widthAnchor.constraint(equalTo: plusButton.heightAnchor)

        ])
    }
}
