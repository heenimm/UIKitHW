// RoastTypeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constant {
    static let darkRoastType = "Темная обжарка"
    static let lightRoastType = "Светлая обжарка"
    static let title = "Уточните обжарку зеренъ"
    static let coffeeColor = "AppCoffee"
    static let greyColor = "AppGrey"
    static let greenColor = "AppGreen"
    static let grainsImage = "grains"
    static let lightRoastImage = "light_roast"
}

/// RoastTypeViewController
final class RoastTypeViewController: UIViewController {
    var textRoastTypeHandler: ((String) -> Void)?

    // MARK: - Private Properties

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 40,
            y: 53,
            width: 294,
            height: 30
        ))
        label.text = Constant.title
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        return label
    }()

    private lazy var lightRoastTypeButton: UIButton = {
        let button = UIButton(
            valueX: 15,
            valueY: 102,
            width: 165,
            height: 165,
            background: Constant.greyColor,
            imageName: Constant.grainsImage,
            title: Constant.lightRoastType
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
            background: Constant.greyColor,
            imageName: Constant.lightRoastImage,
            title: Constant.darkRoastType
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
            textRoastTypeHandler?(text)
            dismiss(animated: true)
        }
        if let text = darkRoastTypeButton.titleLabel?.text {
            textRoastTypeHandler?(text)
            dismiss(animated: true)
        }
    }

    @objc private func tapCancelButton() {
        dismiss(animated: true)
    }
}
