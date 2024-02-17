// UITextField+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

extension UITextField {
    func setDatePicker(target: Any) {
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(
            x: 0,
            y: 0,
            width: screenWidth,
            height: 300
        ))
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        inputView = datePicker
        addTarget(self, action: #selector(didPickerChange(paramdatePicker:)), for: .touchUpInside)
        let toolbar = UIToolbar(frame: CGRect(
            x: 0,
            y: 0,
            width: screenWidth,
            height: 40
        ))
        let done = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(didPickerChange(paramdatePicker:))
        )
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        let cancel = UIBarButtonItem(
            title: "Cancel",
            style: .plain,
            target: nil,
            action: #selector(tapToolbarCancel)
        )
        toolbar.setItems([cancel, flexibleSpace, done], animated: true)
        inputAccessoryView = toolbar
    }

    @objc func didPickerChange(paramdatePicker: UIDatePicker) {
        if let datePicker = inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM yyyy"
            dateFormatter.dateStyle = .medium
            text = dateFormatter.string(from: datePicker.date)
        }
        resignFirstResponder()
    }

    @objc private func tapToolbarCancel() {
        resignFirstResponder()
    }

    func addBottomLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: frame.size.height - 1, width: frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
