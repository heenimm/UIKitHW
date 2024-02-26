// NSLayoutViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let halfSize: CGFloat = 0.5
    static let percentOfSize: CGFloat = 0.2
}

///
final class NSLayoutViewController: UIViewController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubview()
        setupblackConstraint()
        setupyellowConstraint()
        setupredConstraint()
        setupgreenConstraint()
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

    private func setupblackConstraint() {
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -20).isActive = true
        blackView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 20).isActive = true
        blackView.leadingAnchor.constraint(equalTo: yellowView.leadingAnchor, constant: -20).isActive = true
        blackView.trailingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 20).isActive = true
    }

    private func setupyellowConstraint() {
        yellowView.translatesAutoresizingMaskIntoConstraints = false

        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        yellowView.widthAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
    }

    private func setupredConstraint() {
        redView.translatesAutoresizingMaskIntoConstraints = false

        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        redView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -15).isActive = true
        redView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        redView.widthAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
    }

    private func setupgreenConstraint() {
        greenView.translatesAutoresizingMaskIntoConstraints = false

        greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 15).isActive = true
        greenView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        greenView.widthAnchor.constraint(equalTo: greenView.heightAnchor).isActive = true
    }
}
