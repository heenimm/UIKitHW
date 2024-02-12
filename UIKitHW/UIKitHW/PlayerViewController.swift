// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///PlayerViewController управляет страницей на которой отображен список треков
final class PlayerViewController: UIViewController {
    
    // MARK: -
    var tracks: [PlayerModel] = [
        PlayerModel(title: "", singer: "")
    ]

    // MARK: -

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
