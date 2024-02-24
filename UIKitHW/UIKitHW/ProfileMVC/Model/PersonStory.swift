// PersonStory.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

///
struct PersonStory {
    let storyImage: String
    let storyTitle: String
}

struct StoragePersonStory {
    private var personStories: [PersonStory] = [
        PersonStory(
            storyImage: "shattle",
            storyTitle: "Запуск"
        ),
        PersonStory(
            storyImage: "moon",
            storyTitle: "Луна"
        ),
        PersonStory(
            storyImage: "cosmon",
            storyTitle: "Космонавт"
        ),
        PersonStory(
            storyImage: "cosmos",
            storyTitle: "Космос"
        ),
        PersonStory(
            storyImage: "shattle",
            storyTitle: "Запуск"
        ),
        PersonStory(
            storyImage: "shattle",
            storyTitle: "Запуск"
        ),
        PersonStory(
            storyImage: "shattle",
            storyTitle: "Запуск"
        ),
        PersonStory(
            storyImage: "shattle",
            storyTitle: "Запуск"
        )
    ]

    func getPersonStories() -> [PersonStory] {
        personStories
    }
}
