// NotificationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

private enum Constants {
    static let notifications = "Уведомления"
    static let requestSubscribe = "Запросы на подписку"
    static let today = "Сегодня"
    static let thisWeek = "На этой неделе"
    static let fontVerdanaBold = "Verdana-Bold"
    static let fontVerdana = "Verdana"
    static let feedbackImage = "feedback"
    static let shareImage = "share"
    static let userDataImage = "userData"
}

/// В данном классе отображаются уведомления о подписках
final class NotificationViewController: UIViewController {
    private let groupsNotification: [GroupsNotification] = [.today, .thisWeek]
    private var storageNotification = StorageNotification()

    override func viewDidLoad() {
        super.viewDidLoad()
        initSubviews()
        setupTableViewConstraints()
        setupLabelConstraints()
    }

    private let notificationsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.notifications
        label.font = UIFont(name: Constants.fontVerdanaBold, size: 22)
        return label
    }()

    private let requestLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.requestSubscribe
        label.font = UIFont(name: Constants.fontVerdana, size: 14)
        return label
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NotificationViewCell.self, forCellReuseIdentifier: NotificationViewCell.notificationID)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        return tableView
    }()

    private func initSubviews() {
        view.backgroundColor = .white
        view.largeContentTitle = Constants.notifications
        view.addSubviews(tableView, notificationsLabel, requestLabel)
    }

    private func setupLabelConstraints() {
        notificationsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            notificationsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            notificationsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 13),
            notificationsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notificationsLabel.heightAnchor.constraint(equalToConstant: 53)
        ])

        requestLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            requestLabel.topAnchor.constraint(equalTo: notificationsLabel.bottomAnchor, constant: 12),
            requestLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            requestLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            requestLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }

    private func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: requestLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - Extension NotificationViewController + UITableViewDataSource

extension NotificationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        groupsNotification.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch groupsNotification[section] {
        case .today:
            storageNotification.getNotification()[.today]?.count ?? 1
        case .thisWeek:
            storageNotification.getNotification()[.thisWeek]?.count ?? 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: NotificationViewCell.notificationID,
            for: indexPath
        ) as? NotificationViewCell else { return UITableViewCell() }
        guard let notification = storageNotification
            .getNotification()[groupsNotification[indexPath.section]]?[indexPath.row] else { return UITableViewCell() }
        cell.configureCell(notification)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch groupsNotification[section] {
        case .today:
            Constants.today
        case .thisWeek:
            Constants.thisWeek
        }
    }
}

// MARK: - Extension NotificationViewController + UITableViewDelegate

extension NotificationViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        storageNotification.notifications[groupsNotification[indexPath.section]]?.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
