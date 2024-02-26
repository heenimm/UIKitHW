// StackViewViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let halfSize: CGFloat = 2
}

///
final class StackViewViewController: UIViewController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubview()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupSubview()
        stackView.center = view.center
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        if UIDevice.current.orientation.isLandscape {
            // Уменьшаем размер представлений светофора на 20% в ландшафтном режиме
            stackView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            redView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            yellowView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            greenView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        } else {
            // Возвращаем исходный размер представлений светофора в портретном режиме
            stackView.transform = .identity
            redView.transform = .identity
            yellowView.transform = .identity
            greenView.transform = .identity
        }
    }

    // MARK: - Visual Components

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 160,
                height: 410
            )
        )
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .black
        stackView.alignment = .center
        stackView.isBaselineRelativeArrangement = true
        return stackView
    }()

    private lazy var redView: UIView = {
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

    private lazy var yellowView: UIView = {
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

    private lazy var greenView: UIView = {
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
