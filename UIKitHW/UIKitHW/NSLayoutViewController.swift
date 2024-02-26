// NSLayoutViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let halfSize: CGFloat = 0.5
    static let percentOfSize: CGFloat = 0.2
}

/// верстаем светофор констрейнтами
final class NSLayoutViewController: UIViewController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubview()
        setupBlackViewConstraint()
        setupYellowViewConstraint()
        setupRedViewConstraint()
        setupGreenViewConstraint()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        yellowView.layer.cornerRadius = (view.bounds.height * Constants.percentOfSize) * Constants.halfSize
        redView.layer.cornerRadius = (view.bounds.height * Constants.percentOfSize) * Constants.halfSize
        greenView.layer.cornerRadius = (view.bounds.height * Constants.percentOfSize) * Constants.halfSize
    }

    // MARK: - Visual Components

    private lazy var blackView: UIView = {
        let blackView = UIView()
        blackView.backgroundColor = .black
        return blackView
    }()

    private lazy var redView: UIView = {
        let redView = UIView()
        redView.backgroundColor = .red
        redView.layer.cornerRadius = (view.bounds.height * Constants.percentOfSize) * Constants.halfSize
        redView.clipsToBounds = true
        return redView
    }()

    private lazy var yellowView: UIView = {
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        yellowView.layer.cornerRadius = (view.bounds.height * Constants.percentOfSize) * Constants.halfSize
        yellowView.clipsToBounds = true
        return yellowView
    }()

    private lazy var greenView: UIView = {
        let greenView = UIView()
        greenView.backgroundColor = .green
        greenView.layer.cornerRadius = (view.bounds.height * Constants.percentOfSize) * Constants.halfSize
        greenView.clipsToBounds = true
        return greenView
    }()

    // MARK: - Private Methods

    private func setupSubview() {
        view.backgroundColor = .white
        view.addSubview(blackView)
        blackView.addSubview(redView)
        blackView.addSubview(yellowView)
        blackView.addSubview(greenView)
    }

    private func setupBlackViewConstraint() {
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -20).isActive = true
        blackView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 20).isActive = true
        blackView.leadingAnchor.constraint(equalTo: yellowView.leadingAnchor, constant: -20).isActive = true
        blackView.trailingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 20).isActive = true
    }

    private func setupYellowViewConstraint() {
        yellowView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: yellowView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1.0,
                constant: 0.0
            ),
            NSLayoutConstraint(
                item: yellowView,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerY,
                multiplier: 1.0,
                constant: 0.0
            ),
            NSLayoutConstraint(
                item: yellowView,
                attribute: .height,
                relatedBy: .equal,
                toItem: view,
                attribute: .height,
                multiplier: 0.2,
                constant: 0.0
            ),
            NSLayoutConstraint(
                item: yellowView,
                attribute: .width,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .height,
                multiplier: 1.0,
                constant: 0.0
            )
        ])
    }

    private func setupRedViewConstraint() {
        redView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: redView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .top,
                multiplier: 1.0,
                constant: -20
            ),
            NSLayoutConstraint(
                item: redView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1.0,
                constant: 0.0
            ),
            NSLayoutConstraint(
                item: redView,
                attribute: .height,
                relatedBy: .equal,
                toItem: view,
                attribute: .height,
                multiplier: 0.2,
                constant: 0.0
            ),
            NSLayoutConstraint(
                item: redView,
                attribute: .width,
                relatedBy: .equal,
                toItem: redView,
                attribute: .height,
                multiplier: 1.0,
                constant: 0.0
            )
        ])
    }

    private func setupGreenViewConstraint() {
        greenView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: greenView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1.0,
                constant: 0.0
            ),
            NSLayoutConstraint(
                item: greenView,
                attribute: .top,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .bottom,
                multiplier: 1.0,
                constant: 20
            ),
            NSLayoutConstraint(
                item: greenView,
                attribute: .height,
                relatedBy: .equal,
                toItem: view,
                attribute: .height,
                multiplier: 0.2,
                constant: 0.0
            ),
            NSLayoutConstraint(
                item: greenView,
                attribute: .width,
                relatedBy: .equal,
                toItem: greenView,
                attribute: .height,
                multiplier: 1.0,
                constant: 0.0
            )
        ])
    }
}
