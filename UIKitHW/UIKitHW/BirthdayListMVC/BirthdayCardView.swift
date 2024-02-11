// BirthdayCardView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class BirthdayCardView: UIView {
    // MARK: - Private Properties

    lazy var userIconImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 8,
            y: 8,
            width: 75,
            height: 75
        ))
        imageView.image = UIImage(named: "firstIcon")
        imageView.layer.cornerRadius = 6
        return imageView
    }()

    lazy var birthdayIconImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 314,
            y: 25,
            width: 44,
            height: 44
        ))
        imageView.image = UIImage(named: "birthday")
        return imageView
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 102,
            y: 25,
            width: 209,
            height: 20
        ))
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    lazy var birthdayLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 102,
            y: 50,
            width: 209,
            height: 20
        ))
        return label
    }()

    lazy var daysToDateLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 314,
            y: 25,
            width: 44,
            height: 44
        ))
        label.isHidden = true
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "AppPurple")
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    // MARK: - Life Cycle

    override func didMoveToSuperview() {
        setupSubviews()
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        backgroundColor = .white
        addSubviews(userIconImageView, birthdayIconImageView, nameLabel, birthdayLabel, daysToDateLabel)
    }

    @objc private func openBirthdayListScreen() {
//        navigationController?.pushViewController(BirthdayListViewController(), animated: true)
    }
}
