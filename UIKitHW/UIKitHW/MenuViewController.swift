// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let constraintSegue = "constraintVC"
    static let stackViewSegue = "stackViewVC"
}

/// меню выбора светофора сверстанного разными способами
final class MenuViewController: UIViewController {
    @IBAction func openConstraintTrafficLightVC(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.constraintSegue, sender: nil)
    }

    @IBAction func openStackViewTrafficLightVC(_ sender: UIButton) {
        present(StackViewViewController(), animated: true)
    }

    @IBAction func openNSLayoutAnchorTrafficLightVC(_ sender: Any) {
        present(AnchorViewController(), animated: true)
    }

    @IBAction func openNSLayoutConstraintTrafficLightVC(_ sender: Any) {
        present(NSLayoutViewController(), animated: true)
    }

    @IBAction func openVFLTrafficLightVC(_ sender: Any) {
        present(VFLViewController(), animated: true)
    }
}
