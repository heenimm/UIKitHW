// SignUpViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// SignUpViewController
final class SignUpScreenViewController: UIViewController {
    
    @IBOutlet var loginTF: UITextField!

    @IBOutlet var passwordTF: UITextField!

    @IBOutlet var signUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        addSettings()
    }

    private func addSettings() {
        loginTF.addTarget(self, action: #selector(changedTextFields), for: .editingChanged)
        passwordTF.addTarget(self, action: #selector(changedTextFields), for: .editingChanged)

        loginTF.addBottomBorder()
        passwordTF.addBottomBorder()
        signUpButton.layer.cornerRadius = 10
        signUpButton.isEnabled = false
    }

    @IBAction func signUpButtonTap(_ sender: UIButton) {}

    @objc func changedTextFields(_ textField: UITextField) {
        guard let mail = loginTF.text,
              !mail.isEmpty,
              let password = passwordTF.text,
              !password.isEmpty
        else {
            signUpButton.isEnabled = false
            return
        }
        signUpButton.isEnabled = true
        signUpButton.layer.backgroundColor = UIColor(named: "Active")?.cgColor
    }

    private func addFrame() {}
}
