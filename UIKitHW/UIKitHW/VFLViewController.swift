// VFLViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let halfSize: CGFloat = 0.5
    static let percentOfSize: CGFloat = 0.2
}

/// верстаем с помощью языка VFL
final class VFLViewController: UIViewController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubview()
//        setupBlackViewConstraint()
        setupYellowViewConstraint()
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

//    private func setupBlackViewConstraint() {
//        blackView.translatesAutoresizingMaskIntoConstraints = false
//        blackView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -20).isActive = true
//        blackView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 20).isActive = true
//        blackView.leadingAnchor.constraint(equalTo: yellowView.leadingAnchor, constant: -20).isActive = true
//        blackView.trailingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 20).isActive = true
//    }

    private func setupYellowViewConstraint() {
        let viewVFL = [
            "blackView": blackView,
            "redView": redView,
            "yellowView": yellowView,
            "greenView": greenView
        ]
        redView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false

       
        let v = view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|[redView(115)]|",
            options: [],
            metrics: nil,
            views: viewVFL
        ))
//        let h = view.addConstraints(NSLayoutConstraint.constraints(
//            withVisualFormat: "H:|[yellowView(115)]|",
//            options: [],
//            metrics: nil,
//            views: viewVFL
//        ))
//        view.addConstraints(NSLayoutConstraint.constraints(
//            withVisualFormat: "H:|[greenView(115)]|",
//            options: [],
//            metrics: nil,
//            views: viewVFL
//        ))
//        view.addConstraints(NSLayoutConstraint.constraints(
//            withVisualFormat: "V:|[greenView]-[yellowView]-[greenView]|",
//            options: [],
//            metrics: nil,
//            views: viewVFL
//        ))
//        NSLayoutConstraint.activate([h, v])
    }
}
