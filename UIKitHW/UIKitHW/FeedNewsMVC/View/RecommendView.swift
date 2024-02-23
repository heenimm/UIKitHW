// RecommendView.swift
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
final class RecommendView: UIView {
    // MARK: - Private Properties

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: Constants.fontVerdana, size: 10)
        return label
    }()

    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var crossButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(named: "cross"), for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdana, size: 12)
        return button
    }()

    private lazy var subscribeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Подписаться", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdana, size: 10)
        button.layer.cornerRadius = 9
        button.clipsToBounds = true
        button.backgroundColor = UIColor(named: "AppBlue")
        return button
    }()

    // MARK: -

    override func didMoveToSuperview() {
        setupSubview()
    }

    // MARK: - Private Methods

    private func setupSubview() {
        backgroundColor = .white
        addSubviews(nameLabel, userImageView, crossButton, subscribeButton)
        setupConstraints()
        setupSubscribeButtonConstrains()
    }

    private func setupSubscribeButtonConstrains() {
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subscribeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            subscribeButton.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 9),
            subscribeButton.widthAnchor.constraint(equalToConstant: 165),
            subscribeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    func setupConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        crossButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            userImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            userImageView.heightAnchor.constraint(equalToConstant: 115),
            userImageView.widthAnchor.constraint(equalToConstant: 115),

            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
            nameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 2),
            nameLabel.trailingAnchor.constraint(equalTo: userImageView.trailingAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: frame.width),

            crossButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9),
            crossButton.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            crossButton.heightAnchor.constraint(equalToConstant: 7),
            crossButton.widthAnchor.constraint(equalToConstant: 7)

        ])
    }
}
