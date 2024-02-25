// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

enum Constants {
    static let constraintSegue = "constraintVC"
    static let stackViewSegue = "stackViewVC"
}

/// меню выбора светофора сверстанного разными способами
final class MenuViewController: UIViewController {
    @IBAction func openConstraintTrafficLightVC(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.constraintSegue, sender: nil)
    }

    @IBAction func openStackViewTrafficLightVC(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.stackViewSegue, sender: nil)
    }

    @IBAction func openNSLayoutAnchorTrafficLightVC(_ sender: Any) {}

    @IBAction func openNSLayoutConstraintTrafficLightVC(_ sender: Any) {}

    @IBAction func openVFLTrafficLightVC(_ sender: Any) {}
}
