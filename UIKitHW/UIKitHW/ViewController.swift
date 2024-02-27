// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        gradientLayer.colors = [
            UIColor.systemPink.cgColor,
            UIColor.systemOrange.cgColor
        ]
        view.layer.addSublayer(gradientLayer)
    }
}
