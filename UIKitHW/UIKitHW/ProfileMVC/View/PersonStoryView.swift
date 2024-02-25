// PersonStoryView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let fontVerdana = "Verdana"
    static let fontVerdanaBold = "Verdana-Bold"
    static let plusBackgroundColor = "plusBackground"
}

///
final class PersonStoryView: UIView {
    // MARK: - Visual Components

    lazy var postTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: Constants.fontVerdana, size: 10)
        return label
    }()

    lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        return imageView
    }()

    // MARK: - Life Cycle

    override func didMoveToSuperview() {
        setupSubviews()
        setupPostTitleLabelConstraints()
        setupPostImageViewConstraints()
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        addSubviews(postTitleLabel, postImageView)
    }

    func setupPostImageViewConstraints() {
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            postImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            postImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: 49),
            postImageView.widthAnchor.constraint(equalToConstant: 49)
        ])
    }

    func setupPostTitleLabelConstraints() {
        postTitleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            postTitleLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 5),
            postTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            postTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            postImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
