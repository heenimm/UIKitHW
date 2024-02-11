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

    private lazy var emailTextField: UITextField = {
        let textField = UITextField(frame: CGRect(
            x: 20,
            y: 350,
            width: view.frame.width - 40,
            height: 40
        ))
        textField.addBottomLine()
        textField.placeholder = "e-mail"
        return textField
    }()

    private lazy var passwordLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 393,
            width: 175,
            height: 40
        ))
        label.text = "Password"
        label.textColor = .purple
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(
            x: 20,
            y: 433,
            width: view.frame.width - 40,
            height: 40
        ))
        textField.addBottomLine()
        textField.placeholder = "password"
        return textField
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
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        button.addTarget(self, action: #selector(openBirthdayListScreen), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()

    private lazy var iconButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: view.frame.width - 60,
            y: 436,
            width: 40,
            height: 28
        ))
        button.addTarget(self, action: #selector(openBirthdayListScreen), for: .touchUpInside)
        button.setBackgroundImage(
            UIImage(systemName: "eye.slash.fill")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal),
            for: .normal
        )
        return button
    }()

    private lazy var switcher: UISwitch = {
        let switcher = UISwitch(frame: CGRect(
            x: 220,
            y: 550,
            width: 100,
            height: 50
        ))
        switcher.isOn = true
        return switcher
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubviews(iconImageView, appNameLabel, signInLabel)
        view.addSubviews(emailLabel, emailTextField, passwordLabel, passwordTextField)
        view.addSubviews(faceIdLabel, switcher, signInButton, iconButton)
    }

    @objc private func openBirthdayListScreen() {
        navigationController?.pushViewController(BirthdayListViewController(), animated: true)
    }
}
