// NewFriendViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///
final class NewFriendViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        configureNavigationItem()
        navigationItem.title = "fggggg"
        view.backgroundColor = .white
    }

    // MARK: -

    private func configureNavigationItemNewF() {
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

    @objc private func cancel() {}
}
