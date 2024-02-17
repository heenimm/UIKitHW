// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constant {
    static let profile = "Профиль"
}

/// Данный класс создает меню профиля пользователя
final class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        initSubviews()
    }

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.profile
        return label
    }()

    private func initSubviews() {
        view.backgroundColor = .white
        tabBarItem.image = UIImage(systemName: "person.fill")
        title = "Profile"
    }

    private func setupSubviews() {
        titleLabel
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
