// RoastTypeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// RoastTypeViewController
final class RoastTypeViewController: UIViewController {
    var textRoastTypeButton: ((String) -> Void)?

    // MARK: - Private Properties

    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 40,
            y: 53,
            width: 294,
            height: 30
        ))
        label.text = "Уточните обжарку зеренъ"
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        return label
    }()

    private lazy var lightRoastTypeButton: UIButton = {
        let button = UIButton(
            valueX: 15,
            valueY: 102,
            width: 165,
            height: 165,
            background: "AppGrey",
            imageName: "grains",
            title: "Светлая обжарка"
        )
        button.addTarget(self, action: #selector(tapTypeButton), for: .touchUpInside)
        return button
    }()

    private lazy var darkRoastTypeButton: UIButton = {
        let button = UIButton(
            valueX: 195,
            valueY: 102,
            width: 165,
            height: 165,
            background: "AppGrey",
            imageName: "light_roast",
            title: "Темная обжарка"
        )
        button.addTarget(self, action: #selector(tapTypeButton), for: .touchUpInside)
        return button
    }()

    private lazy var cancelButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 20,
            y: 26,
            width: 14,
            height: 14
        ))
        button.setImage(UIImage(named: "cancel"), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(tapCancelButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        setupSubview()
    }

    // MARK: - Private Methods

    private func setupSubview() {
        view.backgroundColor = .white
        view.addSubviews(lightRoastTypeButton, darkRoastTypeButton, cancelButton, titleLabel)
    }

    @objc private func tapTypeButton() {
        if let text = lightRoastTypeButton.titleLabel?.text {
            textRoastTypeButton?(text)
            dismiss(animated: true)
        }
        if let text = darkRoastTypeButton.titleLabel?.text {
            textRoastTypeButton?(text)
            dismiss(animated: true)
        }
    }

    @objc private func tapCancelButton() {
        dismiss(animated: true)
    }
}
