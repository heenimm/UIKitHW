// NotificationViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let notifications = "Уведомления"
    static let requestSubscribe = "Запросы на подписку"
    static let today = "Сегодня"
    static let thisWeek = "На этой неделе"
    static let fontVerdanaBold = "Verdana-Bold"
    static let fontVerdana = "Verdana"
    static let feedbackImage = "feedback"
    static let shareImage = "share"
    static let userDataImage = "userData"
}

///
final class NotificationViewCell: UITableViewCell {
    static let notificationID = "notificationID"
    private var descriptionLabelSize: CGFloat = 240
    private var isHiddenButtonSubscribe = true

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupAvatarImageViewConstraints()
        setupDescriptionLabelConstraints(descriptionLabelSize)
        setupPostIconImageViewConstraints()
        setupSubscribeButtonViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "man")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: Constants.fontVerdana, size: 14)
        return label
    }()

    private lazy var subscribeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Подписаться", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 9
        button.titleLabel?.font = UIFont(name: Constants.fontVerdana, size: 14)
        button.clipsToBounds = true
        button.isHidden = true
        button.addTarget(self, action: #selector(tappedSubscribeButton(_:)), for: .touchUpInside)
        return button
    }()

    private let postIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "castle")
        return imageView
    }()

    private func setupSubviews() {
        contentView.addSubviews(avatarImageView, descriptionLabel)
        contentView.addSubviews(subscribeButton, postIconImageView)
    }

    private func setupAvatarImageViewConstraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func setupDescriptionLabelConstraints(_ descriptionLabelSize: CGFloat) {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            descriptionLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 40),
            descriptionLabel.widthAnchor
                .constraint(equalToConstant: CGFloat(descriptionLabelSize))
        ])
    }

    private func setupPostIconImageViewConstraints() {
        postIconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postIconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            postIconImageView.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 20),
            postIconImageView.heightAnchor.constraint(equalToConstant: 40),
            postIconImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func setupSubscribeButtonViewConstraints() {
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subscribeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            subscribeButton.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 20),
            subscribeButton.heightAnchor.constraint(equalToConstant: 30),
            subscribeButton.widthAnchor.constraint(equalToConstant: 140)
        ])
    }

    @objc private func tappedSubscribeButton(_ sender: UIButton) {
        isHiddenButtonSubscribe = !sender.isSelected
    }
}

extension NotificationViewCell {
    func configureCell(_ notification: Notification) {
        avatarImageView.image = UIImage(named: notification.avatar)
        isHiddenButtonSubscribe = notification.isSubscribeHidden

        if notification.isSubscribeHidden {
            subscribeButton.isHidden = false
            postIconImageView.isHidden = true
            descriptionLabelSize -= 100
            setupDescriptionLabelConstraints(CGFloat(descriptionLabelSize))
            if notification.isNotSubscribe {
                subscribeButton.backgroundColor = .white
                subscribeButton.setTitle("Вы подписаны", for: .normal)
                subscribeButton.layer.borderWidth = 2
                subscribeButton.layer.borderColor = .init(red: 0.9, green: 0.9, blue: 1, alpha: 1)
                subscribeButton.setTitleColor(.gray, for: .normal)
            }
        }
        postIconImageView.image = UIImage(named: notification.postImage ?? "castle")
        descriptionLabel.text = notification.nickname + " " + notification.description
    }
}
