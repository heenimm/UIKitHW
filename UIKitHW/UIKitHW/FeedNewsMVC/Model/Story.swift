// Story.swift
// Copyright © RoadMap. All rights reserved.

enum ViewingStatus {
    case isViewed
    case isNotViewed
}

struct Story {
    let userName: String
    let userIcon: String
    let isViewed: Bool
}

struct StorageStory {
    private let stories: [Story] = [
        Story(userName: "goga", userIcon: "man", isViewed: false),
        Story(userName: "man_in_black", userIcon: "woman", isViewed: false),
        Story(userName: "sun", userIcon: "woman", isViewed: false),
        Story(userName: "future", userIcon: "woman", isViewed: true),
        Story(userName: "rmlink", userIcon: "woman", isViewed: true),
        Story(userName: "yoga", userIcon: "man", isViewed: true)
    ]

    func getStoriesData() -> [Story] {
        stories
    }
}
