// Notification.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

enum GroupsNotification {
    case today
    case thisWeek
}

/// Логика заполнение страницы уведомления
struct Notification {
    let avatar: String
    let nickname: String
    let description: String
    let isSubscribeHidden: Bool
    let isNotSubscribe: Bool
    let postImage: String?
    let dateNotification: Date
}

struct StorageNotification {
    var notifications: [GroupsNotification: [Notification]] = [
        .today: [
            Notification(
                avatar: "man",
                nickname: "ghost",
                description: "понравился ваш комментарий: \"Очень красиво\"",
                isSubscribeHidden: true,
                isNotSubscribe: true,
                postImage: "castle",
                dateNotification: Date()
            ),
            Notification(
                avatar: "horse",
                nickname: "horse_man",
                description: "упомянул(-а) вас в комментарии: \"go в эфир\"",
                isSubscribeHidden: false,
                isNotSubscribe: false,
                postImage: "castle",
                dateNotification: Date()
            )
        ],
        .thisWeek: [
            Notification(
                avatar: "woman",
                nickname: "combo",
                description: "понравился ваш комментарий: \"Спасибо\"",
                isSubscribeHidden: false,
                isNotSubscribe: false,
                postImage: "castle",
                dateNotification: Date()
            ),
            Notification(
                avatar: "woman",
                nickname: "rick_morty",
                description: "появился(-ась) в РМЛинк. Вы можете быть знакомы",
                isSubscribeHidden: true,
                isNotSubscribe: false,
                postImage: nil,
                dateNotification: Date()
            ),
            Notification(
                avatar: "womanOnBeach",
                nickname: "sony",
                description: "появился(-ась) в РМЛинк. Вы можете быть знакомы",
                isSubscribeHidden: true,
                isNotSubscribe: false,
                postImage: nil,
                dateNotification: Date()
            ),
            Notification(
                avatar: "castle",
                nickname: "scorpion",
                description: "появился(-ась) в РМЛинк. Вы можете быть знакомы",
                isSubscribeHidden: true,
                isNotSubscribe: false,
                postImage: nil,
                dateNotification: Date()
            )
        ]
    ]

    func getNotification() -> [GroupsNotification: [Notification]] {
        notifications
    }
}
