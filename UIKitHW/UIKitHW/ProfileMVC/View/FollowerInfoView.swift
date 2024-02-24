// FollowerInfoView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let fontVerdana = "Verdana"
    static let fontVerdanaBold = "Verdana-Bold"
    static let plusBackgroundColor = "plusBackground"
}

/// Рисует информацию о подписчиках
final class FollowerInfoView: UIView {
    // MARK: - Visual Components

    private lazy var publicationsNumberLabel = makeLabel(font: Constants.fontVerdanaBold, textSize: 14, textTitle: "67")
    private lazy var publicationsTextLabel = makeLabel(
        font: Constants.fontVerdana,
        textSize: 10,
        textTitle: "публикации"
    )
    private lazy var subscribersNumberLabel = makeLabel(font: Constants.fontVerdanaBold, textSize: 14, textTitle: "458")
    private lazy var subscribersTextLabel = makeLabel(
        font: Constants.fontVerdana,
        textSize: 10,
        textTitle: "подписчики"
    )
    private lazy var subscriptionsNumberLabel = makeLabel(
        font: Constants.fontVerdanaBold,
        textSize: 14,
        textTitle: "120"
    )
    private lazy var subscriptionsTextLabel = makeLabel(
        font: Constants.fontVerdana,
        textSize: 10,
        textTitle: "подписки"
    )

    // MARK: - Life Cycle

    override func didMoveToSuperview() {
        setupSubviews()
        setupPublicationsLabelConstraints()
        setupSubscribersLabelConstraints()
        setupSubscriptionsLabelConstraints()
    }

    // MARK: - Private Methods

    private func makeLabel(font: String, textSize: CGFloat, textTitle: String) -> UILabel {
        let label = UILabel()
        label.text = textTitle
        label.textAlignment = .center
        label.font = UIFont(name: font, size: textSize)
        return label
    }

    private func setupSubviews() {
        addSubviews(publicationsNumberLabel, publicationsTextLabel)
        addSubviews(subscribersNumberLabel, subscribersTextLabel)
        addSubviews(subscriptionsNumberLabel, subscriptionsTextLabel)
    }

    private func setupPublicationsLabelConstraints() {
        publicationsNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        publicationsTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            publicationsNumberLabel.topAnchor.constraint(equalTo: topAnchor),
            publicationsNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            publicationsNumberLabel.heightAnchor.constraint(equalToConstant: 17),
            publicationsNumberLabel.widthAnchor.constraint(equalToConstant: 50),

            publicationsTextLabel.topAnchor.constraint(equalTo: publicationsNumberLabel.bottomAnchor),
            publicationsTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            publicationsTextLabel.heightAnchor.constraint(equalToConstant: 12),
            publicationsTextLabel.widthAnchor.constraint(equalToConstant: 70)
        ])
    }

    private func setupSubscribersLabelConstraints() {
        subscribersNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        subscribersTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subscribersNumberLabel.topAnchor.constraint(equalTo: topAnchor),
            subscribersNumberLabel.leadingAnchor.constraint(
                equalTo: publicationsNumberLabel.trailingAnchor,
                constant: 20
            ),
            subscribersNumberLabel.heightAnchor.constraint(equalToConstant: 17),
            subscribersNumberLabel.widthAnchor.constraint(equalToConstant: 50),

            subscribersTextLabel.topAnchor.constraint(equalTo: subscribersNumberLabel.bottomAnchor),
            subscribersTextLabel.leadingAnchor.constraint(equalTo: publicationsTextLabel.trailingAnchor, constant: 5),
            subscribersTextLabel.heightAnchor.constraint(equalToConstant: 12),
            subscribersTextLabel.widthAnchor.constraint(equalToConstant: 70)
        ])
    }

    private func setupSubscriptionsLabelConstraints() {
        subscriptionsNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        subscriptionsTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subscriptionsNumberLabel.topAnchor.constraint(equalTo: topAnchor),
            subscriptionsNumberLabel.leadingAnchor.constraint(
                equalTo: subscribersNumberLabel.trailingAnchor,
                constant: 20
            ),
            subscriptionsNumberLabel.heightAnchor.constraint(equalToConstant: 17),
            subscriptionsNumberLabel.widthAnchor.constraint(equalToConstant: 50),

            subscriptionsTextLabel.topAnchor.constraint(equalTo: subscriptionsNumberLabel.bottomAnchor),
            subscriptionsTextLabel.leadingAnchor.constraint(equalTo: subscribersTextLabel.trailingAnchor, constant: 5),
            subscriptionsTextLabel.heightAnchor.constraint(equalToConstant: 12),
            subscriptionsTextLabel.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
}
