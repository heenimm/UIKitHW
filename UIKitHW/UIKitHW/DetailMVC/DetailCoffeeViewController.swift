// DetailCoffeeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit


/// DetailCoffeeViewController отображает меню выбора кофе
enum Constant {
    static let darkRoastType = "Темная обжарка"
    static let promocode = "Промокод на чашку кофе"
    static let backgroundViewColor = "AppCoffee"
}
final class DetailCoffeeViewController: UIViewController {
    // MARK: - Private Properties

    private var roastTypeViewController = RoastTypeViewController()

    private var segmentedControlItems: [String] = ["Американо", "Капучино", "Латте"]
    private var segmentedControlImages = [
        UIImage(named: "американо"),
        UIImage(named: "капучино"),
        UIImage(named: "латте"),
    ]
    private var prices = [200, 100, 100]

    private lazy var backgroundView: UIView = {
        let view = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: 346
        ))
        view.backgroundColor = UIColor(named: Constant.backgroundViewColor)
        view.layer.cornerRadius = 20
        return view
    }()

    private lazy var coffeeImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 112,
            y: 128,
            width: 150,
            height: 150
        ))
        imageView.image = segmentedControlImages[0]
        return imageView
    }()

    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: segmentedControlItems)
        segmentedControl.frame = CGRect(
            x: 15,
            y: 368,
            width: Int(view.frame.width) - Insets.leftInset,
            height: 44
        )
        segmentedControl.backgroundColor = UIColor(named: "AppGrey")
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
        return segmentedControl
    }()

    private lazy var roastTypeButton: UIButton = {
        let button = UIButton(
            valueX: 15,
            valueY: 482,
            width: 165,
            height: 165,
            background: "AppGrey",
            imageName: "grains",
            title: Constant.darkRoastType
        )
        button.addTarget(self, action: #selector(openRoastTypeViewController), for: .touchUpInside)
        return button
    }()

    private lazy var ingredientButton: UIButton = {
        let button = UIButton(
            valueX: 195,
            valueY: 482,
            width: 165,
            height: 165,
            background: "AppGrey",
            imageName: "plus",
            title: "Дополнительные ингредиенты"
        )
        button.titleEdgeInsets = UIEdgeInsets(top: 80, left: -15, bottom: -2, right: 10)
        button.imageEdgeInsets = UIEdgeInsets(top: -80, left: 65, bottom: -50, right: 10)
        button.addTarget(self, action: #selector(openGrainsViewController), for: .touchUpInside)
        return button
    }()

    private lazy var buyButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 15,
            y: 717,
            width: 345,
            height: 53
        ))
        button.backgroundColor = UIColor(named: "AppGreen")
        button.layer.cornerRadius = 10
        button.setTitle("Заказать", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(openOrderViewController), for: .touchUpInside)
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
        label.text = "Цѣна - \(prices[0]) руб"
        return label
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        view.backgroundColor = .white
        setupSubview()
        configureBarButton()
    }

    // MARK: - Private Methods

    private func setupSubview() {
        roastTypeViewController.textRoastTypeHandler = { [weak self] text in
            self?.roastTypeButton.titleLabel?.text = text
        }
        view.addSubviews(backgroundView, coffeeImageView, segmentedControl)
        view.addSubviews(roastTypeButton, ingredientButton, buyButton, priceLabel)
    }

    private func configureBarButton() {
        let shareBarButton = UIBarButtonItem(
            image: UIImage(named: "share"),
            style: .done,
            target: self,
            action: #selector(makeActivityViewController)
        )
        navigationItem.rightBarButtonItem = shareBarButton
    }

    @objc private func makeActivityViewController() {
        let activityViewController = UIActivityViewController(
            activityItems: [Constant.promocode],
            applicationActivities: nil
        )
        present(activityViewController, animated: true)
    }

    @objc private func selectedValue(target: UISegmentedControl) {
        if target == segmentedControl {
            let segmentIndex = target.selectedSegmentIndex
            coffeeImageView.image = segmentedControlImages[segmentIndex]
            priceLabel.text = "Цѣна - \(prices[segmentIndex]) руб"
        }
    }

    @objc private func openRoastTypeViewController() {
        present(RoastTypeViewController(), animated: true)
    }

    @objc private func openGrainsViewController() {
        present(GrainsViewController(), animated: true)
    }

    @objc private func openOrderViewController() {
        present(OrderViewController(), animated: true)
    }
}
