// DetailCoffeeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class DetailCoffeeViewController: UIViewController {
    // MARK: -

    private var segmentedControlItems: [String] = ["Американо", "Капучино", "Латте"]

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupSubview()
    }

    // MARK: - Private Properties

    private lazy var backgroundView: UIView = {
        let view = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: 346
        ))
        view.backgroundColor = UIColor(named: "AppCoffee")
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
        imageView.image = UIImage(named: "cup")
        return imageView
    }()

    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: segmentedControlItems)
        segmentedControl.frame = CGRect(
            x: 15,
            y: 368,
            width: view.frame.width - 30,
            height: 44
        )
        print(segmentedControl.numberOfSegments)
        segmentedControl.backgroundColor = UIColor(named: "AppGrey")
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()

    private lazy var roastTypeButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 15,
            y: 482,
            width: 165,
            height: 165
        ))
        button.backgroundColor = UIColor(named: "AppGrey")
        button.setImage(UIImage(named: "grains"), for: .normal)
        return button
    }()

    private lazy var ingredientButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 195,
            y: 482,
            width: 165,
            height: 165
        ))
        button.backgroundColor = UIColor(named: "AppGrey")
        button.setImage(UIImage(named: "plus"), for: .normal)
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
        return button
    }()

    // MARK: - Private Methods

    private func setupSubview() {
        view.addSubviews(backgroundView, coffeeImageView, segmentedControl)
        view.addSubviews(roastTypeButton, ingredientButton, buyButton)
    }
}
