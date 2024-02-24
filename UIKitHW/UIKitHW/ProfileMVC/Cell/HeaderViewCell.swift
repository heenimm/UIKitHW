// HeaderViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let defaultText = "Ваша история"
    static let fontVerdana = "Verdana"
    static let plusBackgroundColor = "AppPlusBackground"
    static let firstStory = "firstStory"
    static let fontVerdanaBold = "Verdana-Bold"
    static let nameText = "Мария Иванова"
    static let jobText = "Консультат"
    static let linkText = "📎www.spacex.com"
    static let changeText = "Изменить"
    static let shareProfileText = "Поделиться профилем"
    static let addPersonImage = "addPerson"
}

///Позволяет открыть окно веббраузера
protocol HeaderViewCellDelegate: AnyObject {
    func openWebPageScreen()
}

/// Отрисовываем информацию пользователя
final class HeaderViewCell: UITableViewCell {
    // MARK: - Static Properties

    static let reuseID = String(describing: HeaderViewCell.self)

    weak var delegate: HeaderViewCellDelegate?

    // MARK: - Visual Components

    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        imageView.image = UIImage(named: Constants.firstStory)
        imageView.clipsToBounds = true
        return imageView
    }()

    private let userPlusButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(named: Constants.plusBackgroundColor)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = 13
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont(name: Constants.fontVerdana, size: 14)
        return button
    }()

    private lazy var linkingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.linkText, for: .normal)
        button.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        return button
    }()

    private lazy var userNameLabel = UILabel(
        font: Constants.fontVerdanaBold,
        textSize: 14,
        textTitle: Constants.nameText
    )
    private lazy var userJobLabel = UILabel(
        font: Constants.fontVerdana,
        textSize: 14,
        textTitle: Constants.jobText
    )
    private lazy var changeButton = UIButton(
        font: Constants.fontVerdanaBold,
        textSize: 10,
        textTitle: Constants.changeText
    )
    private lazy var shareButton = UIButton(
        font: Constants.fontVerdanaBold,
        textSize: 10,
        textTitle: Constants.shareProfileText
    )

    private lazy var addButton = UIButton(
        font: Constants.fontVerdanaBold,
        textSize: 10,
        textTitle: ""
    )

    private lazy var followerInfoView = FollowerInfoView()

    @objc private func openLink() {
        delegate?.openWebPageScreen()
    }

    // MARK: - Life Cycle

    override func didMoveToSuperview() {
        setupSubview()
        setupUserImageViewConstraints()
        setupUserPlusButtonConstraints()
        setupFollowerInfoViewConstraints()
        setupUsernameLabelConstraints()
        setupUserJobLabelConstraints()
        setupLinkButtonConstraints()
        setupChangeButtonConstraints()
        setupShareButtonConstraints()
        setupAddButtonConstraints()
    }

    // MARK: - Private Methods

    private func setupSubview() {
        contentView.addSubviews(userImageView, userPlusButton, followerInfoView)
        contentView.addSubviews(userJobLabel, userNameLabel, linkingButton)
        contentView.addSubviews(changeButton, shareButton, addButton)
        addButton.setImage(UIImage(named: Constants.addPersonImage), for: .normal)
        userJobLabel.textAlignment = .left
    }

    private func setupUserImageViewConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            userImageView.widthAnchor.constraint(equalToConstant: 80),
            userImageView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    private func setupUsernameLabelConstraints() {
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            userNameLabel.widthAnchor.constraint(equalToConstant: 150),
            userNameLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
    }

    private func setupUserJobLabelConstraints() {
        userJobLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userJobLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            userJobLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            userJobLabel.widthAnchor.constraint(equalToConstant: 140),
            userJobLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
    }

    private func setupLinkButtonConstraints() {
        linkingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            linkingButton.topAnchor.constraint(equalTo: userJobLabel.bottomAnchor, constant: 10),
            linkingButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            linkingButton.widthAnchor.constraint(equalToConstant: 170),
            linkingButton.heightAnchor.constraint(equalToConstant: 17)
        ])
    }

    private func setupUserPlusButtonConstraints() {
        userPlusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userPlusButton.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: -26),
            userPlusButton.topAnchor.constraint(equalTo: userImageView.topAnchor, constant: 55),
            userPlusButton.widthAnchor.constraint(equalToConstant: 26),
            userPlusButton.heightAnchor.constraint(equalToConstant: 26)
        ])
    }

    private func setupFollowerInfoViewConstraints() {
        followerInfoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followerInfoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            followerInfoView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 48),
            followerInfoView.widthAnchor.constraint(equalToConstant: 210),
            followerInfoView.heightAnchor.constraint(equalToConstant: 31)
        ])
    }

    private func setupChangeButtonConstraints() {
        changeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            changeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            changeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            changeButton.widthAnchor.constraint(equalToConstant: 155),
            changeButton.heightAnchor.constraint(equalToConstant: 27)
        ])
    }

    private func setupShareButtonConstraints() {
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shareButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            shareButton.leadingAnchor.constraint(equalTo: changeButton.trailingAnchor, constant: 5),
            shareButton.widthAnchor.constraint(equalToConstant: 155),
            shareButton.heightAnchor.constraint(equalToConstant: 27)
        ])
    }

    private func setupAddButtonConstraints() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            addButton.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: 5),
            addButton.widthAnchor.constraint(equalToConstant: 30),
            addButton.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
}
