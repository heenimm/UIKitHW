// SignUpViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// SignUpViewController окно на котором вводятся учетные данные и по нажатию на кнопку открывается список именниников
final class SignUpViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: view.frame.width / 2 - 65,
            y: 70,
            width: 125,
            height: 125
        ))
        imageView.image = UIImage(named: "startIcon")
        return imageView
    }()

    private lazy var appNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: view.frame.width / 2 - 55,
            y: 200,
            width: 175,
            height: 44
        ))
        label.text = "Birthday Reminder"
        label.numberOfLines = 0
        label.textColor = UIColor(named: "AppPurple")
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        return label
    }()

    private lazy var signInLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 266,
            width: 175,
            height: 44
        ))
        label.text = "SignIn"
        label.textColor = .purple
        label.font = UIFont(name: "Verdana-Bold", size: 26)
        return label
    }()

    private lazy var emailLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 318,
            width: 175,
            height: 44
        ))
        label.text = "Email"
        label.textColor = .purple
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private lazy var passwordLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 393,
            width: 175,
            height: 44
        ))
        label.text = "Password"
        label.textColor = .purple
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private lazy var faceIdLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 86,
            y: 544,
            width: 175,
            height: 44
        ))
        label.text = "Use FaceID"
        label.textColor = .purple
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private lazy var signInButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 20,
            y: 671,
            width: view.frame.width - 40,
            height: 44
        ))

        button.titleLabel?.textColor = .white
        button.titleLabel?.text = "Use FaceID"
        button.backgroundColor = UIColor(named: "AppRed")
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        button.addTarget(self, action: #selector(openBirthdayListScreen), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubview(iconImageView)
        view.addSubview(appNameLabel)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(passwordLabel)
        view.addSubview(faceIdLabel)
        view.addSubview(signInButton)
    }

    @objc private func openBirthdayListScreen() {
        navigationController?.pushViewController(BirthdayListViewController(), animated: true)
    }
}
