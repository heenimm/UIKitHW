// BirthdayListViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// BirthdayListViewController - вью контроллер отображает список друзей и позволяет перейти на экран добавления новых
/// данных по нажатию на плюсик
final class BirthdayListViewController: UIViewController {
    // MARK: - Private Properties

    private var cards: [CardModel] = [
        CardModel(
            icon: "firstIcon", name: "Helena Link", date: "10.03 - turns 25!", days: "birthday"
        ),
        CardModel(
            icon: "secondIcon", name: "Verona Tusk", date: "20.03 - turns 39", days: "10 days"
        ),
        CardModel(
            icon: "thirdIcon", name: "Alex Smith", date: "21.04 - turns 51", days: "42 days"
        ),
        CardModel(
            icon: "lastIcon", name: "Tom Johnson", date: "05.06 - turns 18", days: "87 days"
        )
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        initSubviews()
    }

    // MARK: - Private Methods

    private func configureNavigationItem() {
        navigationItem.title = "Birthday Reminder"
        let rightBarButton = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(addNewItem)
        )
        navigationItem.rightBarButtonItem = rightBarButton
    }

    private func initSubviews() {
        view.backgroundColor = .white
        for index in 0 ..< cards.count {
            let view = BirthdayCardView(frame: CGRect(
                x: 20,
                y: 105 * (index + 1),
                width: Int(view.frame.size.width) - 40,
                height: 100
            ))
            view.userIconImageView.image = UIImage(named: cards[index].icon)
            view.nameLabel.text = cards[index].name
            view.birthdayLabel.text = cards[index].date
            view.daysToDateLabel.text = cards[index].days
            if index != 0 {
                view.birthdayIconImageView.isHidden = true
                view.daysToDateLabel.isHidden = false
            }
            self.view.addSubview(view)
        }
    }

    @objc private func addNewItem() {
        let modalViewController = NewFriendViewController()
        let navigationController = UINavigationController(rootViewController: modalViewController)
        present(navigationController, animated: true)
    }
}
