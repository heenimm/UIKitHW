// VFLViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let halfSize: CGFloat = 2
}

///
final class VFLViewController: UIViewController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubview()
    }

    // MARK: - Visual Components

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: CGRect(
            x: view.bounds.width / 2,
            y: 100,
            width: view.bounds.width / 2,
            height: view.bounds.height / 2
        ))
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .black
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let redView: UIView = {
        let view = UIView(frame: CGRect(
            x: 20,
            y: 20,
            width: 115,
            height: 115
        ))
        view.backgroundColor = .red
        view.layer.cornerRadius = view.bounds.width / Constants.halfSize
        view.clipsToBounds = true
        return view
    }()

    private let yellowView: UIView = {
        let view = UIView(frame: CGRect(
            x: 20,
            y: 145,
            width: 115,
            height: 115
        ))
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        return view
    }()

    private let greenView: UIView = {
        let view = UIView(frame: CGRect(
            x: 20,
            y: 275,
            width: 115,
            height: 115
        ))
        view.backgroundColor = .green
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        return view
    }()

    // MARK: - Private Methods

    private func setupSubview() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.addSubview(redView)
        stackView.addSubview(yellowView)
        stackView.addSubview(greenView)
    }
}
