// UserInfoView.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

///
class UserInfoView: UIView {
    // MARK: - Private Properties

    private var ages = ["1", "2", "3", "4", "5", "6", "7", "10"]
    private var genders = ["male", "female"]

    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 20,
            width: 335,
            height: 75
        ))
        label.text = "Name Surname"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private lazy var nameTextField: UITextField = {
        let textField = UITextField(frame: CGRect(
            x: 20,
            y: 70,
            width: 335,
            height: 40
        ))
        textField.placeholder = "enter name"
        return textField
    }()

    private lazy var birthdayLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 100,
            width: 335,
            height: 40
        ))
        label.text = "Birthday"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private lazy var birthdayTextField: UITextField = {
        let textField = UITextField(frame: CGRect(
            x: 20,
            y: 140,
            width: 335,
            height: 40
        ))
        return textField
    }()

    private lazy var ageLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 180,
            width: 335,
            height: 40
        ))
        label.text = "Age"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private lazy var agePickerView: UIPickerView = {
        let pickerView = UIPickerView(frame: .zero)
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.tag = 1
        return pickerView
    }()

    private lazy var ageTextField: UITextField = {
        let textField = UITextField(frame: CGRect(
            x: 20,
            y: 220,
            width: 335,
            height: 40
        ))

        textField.placeholder = "enter age"
        textField.inputView = agePickerView
        textField.inputView?.backgroundColor = .white
        return textField
    }()

    private lazy var genderLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 260,
            width: 335,
            height: 75
        ))
        label.text = "Gender"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private lazy var genderPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.tag = 2
        return pickerView
    }()

    private lazy var genderTextField: UITextField = {
        let textField = UITextField(frame: CGRect(
            x: 20,
            y: 300,
            width: 335,
            height: 40
        ))
        textField.placeholder = "enter age"
        textField.inputView = genderPickerView
        textField.inputView?.backgroundColor = .white
        return textField
    }()

    private lazy var telegramLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 335,
            width: 335,
            height: 75
        ))
        label.text = "Telegram"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private lazy var telegramTextField: UITextField = {
        let textField = UITextField(frame: CGRect(
            x: 20,
            y: 375,
            width: 335,
            height: 40
        ))

        textField.placeholder = "enter age"
        return textField
    }()

    // MARK: - Life Cycle

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        birthdayTextField.setDatePicker(target: self, selector: #selector(selectedDate))
        setupSubviews()
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        addSubviews(nameLabel, birthdayLabel, ageLabel, genderLabel, telegramLabel)
        addSubviews(nameTextField, ageTextField, birthdayTextField, genderTextField, telegramTextField)
    }

    @objc private func selectedDate() {
        if let datePicker = birthdayTextField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM yyyy"
            dateFormatter.dateStyle = .medium
            birthdayTextField.text = dateFormatter.string(from: datePicker.date)
        }
        birthdayTextField.resignFirstResponder()
    }

    @objc private func closeToolbarFromTextField() {
        ageTextField.resignFirstResponder()
    }
}

// MARK: - Extension UIPickerViewDataSource

extension UserInfoView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return ages.count
        case 2:
            return genders.count
        default:
            return 1
        }
    }
}

// MARK: - Extension UIPickerViewDataSource

extension UserInfoView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return ages[row]
        case 2:
            return genders[row]
        default:
            return "1"
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            ageTextField.text = ages[row]
            ageTextField.resignFirstResponder()
        case 2:
            genderTextField.text = genders[row]
            genderTextField.resignFirstResponder()
        default:
            return
        }
    }
}
