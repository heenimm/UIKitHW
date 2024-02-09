// SettingsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// SettingsViewController
final class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

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
            let checkViewController = storyBoard.instantiateViewController(identifier: "CheckViewController")
            self.navigationController?.pushViewController(checkViewController, animated: true)
        }
        let cancelAction = UIAlertAction(
            title: "Отмена",
            style: .cancel
        )
        alert.addAction(checkAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
