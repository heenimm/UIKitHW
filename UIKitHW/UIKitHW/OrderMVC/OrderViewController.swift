// OrderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// OrderViewController
final class OrderViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var leftImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 20,
            y: 47,
            width: 100,
            height: 72
        ))
        imageView.image = UIImage(named: "left")
        return imageView
    }()

    private lazy var rightImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 250,
            y: 47,
            width: 100,
            height: 72
        ))
        imageView.image = UIImage(named: "right")
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 80,
            width: 350,
            height: 60
        ))
        label.text = "Вашъ Заказъ"
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var centerImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 145,
            y: 472,
            width: 100,
            height: 40
        ))
        imageView.image = UIImage(named: "picture")
        return imageView
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

    lazy var priceLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 200,
            y: 669,
            width: 200,
            height: 50
        ))

        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.text = "Цѣна - \(calculatedPrice()) руб"
        return label
    }()

    lazy var coffeeTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 200,
            width: 200,
            height: 50
        ))

        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.text = "Американо"
        return label
    }()

    lazy var milkLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 250,
            width: 200,
            height: 50
        ))

        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.text = "Молоко"
        return label
    }()

    lazy var priceIngredientLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 280,
            y: 300,
            width: 200,
            height: 50
        ))
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.text = "50 руб"
        return label
    }()

    lazy var priceCoffeeLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 280,
            y: 200,
            width: 200,
            height: 50
        ))
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.text = "100 руб"
        return label
    }()

    lazy var priceMilkLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 280,
            y: 250,
            width: 200,
            height: 50
        ))

        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.text = "50 руб"
        return label
    }()

    lazy var ingredientLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 300,
            width: 200,
            height: 50
        ))

        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.text = "Эспрессо 50мл"
        return label
    }()

    lazy var totalAmountLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 120,
            y: 440,
            width: 200,
            height: 50
        ))
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.text = "Цѣна - 200 руб"
        return label
    }()

    private lazy var buyButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 15,
            y: 600,
            width: 345,
            height: 53
        ))
        button.backgroundColor = UIColor(named: "AppGreen")
        button.layer.cornerRadius = 10
        button.setTitle("Оплатить", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(openGratitudeController), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        setupSubview()
    }

    // MARK: - Private Methods

    private func setupSubview() {
        view.backgroundColor = .white
        view.addSubviews(titleLabel, coffeeTitleLabel, milkLabel, ingredientLabel)
        view.addSubviews(cancelButton, leftImageView, rightImageView, centerImageView)
        view.addSubviews(priceMilkLabel, priceCoffeeLabel, priceIngredientLabel)
        view.addSubviews(totalAmountLabel, buyButton)
    }

    private func calculatedPrice() -> Int {
        100
    }

    @objc private func tapCancelButton() {
        dismiss(animated: true)
    }

    @objc private func openGratitudeController() {
        dismiss(animated: true)
        navigationController?.pushViewController(GratitudeController(), animated: true)
    }
}
