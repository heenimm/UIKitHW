// SignUpViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// SignUpViewController на этом экране регистрируется пользователь и после открывается след экран
final class SignUpScreenViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signUpButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }

    // MARK: - Private Methods

    private func initViews() {
        emailTextField.addBottomBorder()
        passwordTextField.addBottomBorder()
    }

    // MARK: - Private @IBAction

    @IBAction private func signUpButtonTap(_ sender: UIButton) {}

    @objc private func changedTextFields(_ textField: UITextField) {
        guard let mail = emailTextField.text,
              mail.isValidEmail(),
              let password = passwordTextField.text,
              !password.isEmpty
        else {
            signUpButton.isEnabled = false
            return
        }
        signUpButton.isEnabled = true
    }
}
