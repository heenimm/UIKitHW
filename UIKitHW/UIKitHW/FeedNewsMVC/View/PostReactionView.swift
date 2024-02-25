// PostReactionView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let heartImage = "heart"
    static let messageImage = "messageIcon"
    static let shareImage = "share"
    static let bookmarkImage = "bookmark"
}

/// отображает реакции на пост
final class PostReactionView: UIView {
    // MARK: - Private Properties

    private lazy var likeButton: UIButton = makeReactionButton(image: UIImage(named: Constants.heartImage)!)
    private lazy var commentsButton: UIButton = makeReactionButton(image: UIImage(named: Constants.messageImage)!)
    private lazy var shareButton: UIButton = makeReactionButton(image: UIImage(named: Constants.shareImage)!)
    private lazy var bookmarkButton: UIButton = makeReactionButton(image: UIImage(named: Constants.bookmarkImage)!)

    override func didMoveToSuperview() {
        setupSubviews()
        setupLikesButtonViewConstraints()
        setupCommentsButtonViewConstraints()
        setupShareButtonViewConstraints()
        setupBookmarkButtonViewConstraints()
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        addSubviews(likeButton, commentsButton, shareButton, bookmarkButton)
    }

    private func makeReactionButton(image: UIImage) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        button.widthAnchor.constraint(equalToConstant: 24).isActive = true
        return button
    }

    private func setupLikesButtonViewConstraints() {
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            likeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }

    private func setupCommentsButtonViewConstraints() {
        commentsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            commentsButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            commentsButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 10)
        ])
    }

    private func setupShareButtonViewConstraints() {
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shareButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            shareButton.leadingAnchor.constraint(equalTo: commentsButton.trailingAnchor, constant: 10)
        ])
    }

    private func setupBookmarkButtonViewConstraints() {
        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookmarkButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            bookmarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9)
        ])
    }
}
