// SettingsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// SettingsViewController отображены поля ввода данных для именниников
final class SettingsViewController: UIViewController {
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - Private Methods
    @IBAction func payiedButton(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Выставить счет?",
            message: "",
            preferredStyle: .alert
        )
        let checkAction = UIAlertAction(
            title: "Чек",
            style: .default
        ) { _ in
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let checkViewController = storyBoard.instantiateViewController(withIdentifier: "CheckViewController")
            checkViewController.modalPresentationStyle = .fullScreen
            self.present(checkViewController, animated: true)
        }
        let cancelAction = UIAlertAction(
            title: "Отмена",
            style: .cancel
        )
        alert.addAction(checkAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
