// OrderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constant {
    static let coffeeColor = "AppCoffee"
    static let greyColor = "AppGrey"
    static let greenColor = "AppGreen"
    static let totalAmount = "Цѣна - 200 руб"
    static let yourOrdered = "Вашъ Заказъ"
    static let centerImage = "picture"
    static let leftImage = "left"
    static let rightImage = "right"
    static let cancelImage = "cancel"
    static let payed = "Оплатить"
    static let americano = "Американо"
    static let milk = "Молоко"
    static let price50 = "50 руб"
    static let price100 = "100 руб"
    static let espresso = "Эспрессо 50мл"
    static let leftInset = 40
}

/// OrderViewController
final class OrderViewController: UIViewController {
    // MARK: - Private Properties

    private let leftImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 20,
            y: 47,
            width: 100,
            height: 72
        ))
        imageView.image = UIImage(named: Constant.leftImage)
        return imageView
    }()

    private let rightImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 250,
            y: 47,
            width: 100,
            height: 72
        ))
        imageView.image = UIImage(named: Constant.rightImage)
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 80,
            width: 350,
            height: 60
        ))
        label.text = Constant.yourOrdered
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let centerImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 145,
            y: 472,
            width: 100,
            height: 40
        ))
        imageView.image = UIImage(named: Constant.centerImage)
        return imageView
    }()

    private lazy var cancelButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 20,
            y: 26,
            width: 14,
            height: 14
        ))
        button.setImage(UIImage(named: Constant.cancelImage), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(tapCancelButton), for: .touchUpInside)
        return button
    }()

    private let priceLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 200,
            y: 669,
            width: 200,
            height: 50
        ))

        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.text = Constant.totalAmount
        return label
    }()

    private let coffeeTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 200,
            width: 200,
            height: 50
        ))

        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.text = Constant.americano
        return label
    }()

    private let milkLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 250,
            width: 200,
            height: 50
        ))

        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.text = Constant.milk
        return label
    }()

    private let priceIngredientLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 280,
            y: 300,
            width: 200,
            height: 50
        ))
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.text = Constant.price50
        return label
    }()

    private let priceCoffeeLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 280,
            y: 200,
            width: 200,
            height: 50
        ))
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.text = Constant.price100
        return label
    }()

    private let priceMilkLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 280,
            y: 250,
            width: 200,
            height: 50
        ))

        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.text = Constant.price50
        return label
    }()

    private let ingredientLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 20,
            y: 300,
            width: 200,
            height: 50
        ))

        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.text = Constant.espresso
        return label
    }()

    private let totalAmountLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 120,
            y: 440,
            width: 200,
            height: 50
        ))
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.text = Constant.totalAmount
        return label
    }()

    private lazy var buyButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 15,
            y: 600,
            width: 345,
            height: 53
        ))
        button.backgroundColor = UIColor(named: Constant.greenColor)
        button.layer.cornerRadius = 10
        button.setTitle(Constant.payed, for: .normal)
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

    @objc private func tapCancelButton() {
        dismiss(animated: true)
    }

    @objc private func openGratitudeController() {
        dismiss(animated: true)
        present(GratitudeViewController(), animated: true)
//        navigationController?.popToViewController(DetailCoffeeViewController(), animated: true)
//        navigationController?.pushViewController(GratitudeController(), animated: true)
    }
}
