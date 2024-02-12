// NewFriendViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// NewFriendViewController - данное окно имеет несколько полей с дейтпикерами для задания им значений
final class NewFriendViewController: UIViewController {
    // MARK: - Private Properties

    private lazy var userPhotoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: view.frame.width / 2 - 65,
            y: 66,
            width: 125,
            height: 125
        ))
        imageView.image = UIImage(systemName: "person.crop.circle.fill")?
            .withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        return imageView
    }()

    private lazy var userInfoView: UserInfoView = {
        let userInfoView = UserInfoView(frame: CGRect(
            x: 20,
            y: 300,
            width: view.frame.width,
            height: view.frame.height - 300
        ))
        return userInfoView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        setupSubviews()
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubviews(userPhotoImageView, userInfoView)
    }

    private func configureNavigationItem() {
        let rightBarButton = UIBarButtonItem(
            title: "Add",
            style: .plain,
            target: self,
            action: #selector(add)
        )
        let leftBarButton = UIBarButtonItem(
            title: "Cancel",
            style: .done,
            target: self,
            action: #selector(cancel)
        )
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = rightBarButton
    }

    @objc private func add() {}

    @objc private func cancel() {
        dismiss(animated: true)
    }
}
