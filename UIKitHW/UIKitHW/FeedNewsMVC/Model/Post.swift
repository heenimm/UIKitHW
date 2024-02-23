// Post.swift
// Copyright © RoadMap. All rights reserved.

struct Post {
    let avatarImageName: String
    let nickName: String
    let imageNames: [String]
    let title: String
    let timeStamp: String
}

struct StoragePost {
    var posts = [
        Post(
            avatarImageName: "womanOnBeach",
            nickName: "mouse",
            imageNames: ["mountain", "castle", "canyon"],
            title: "",
            timeStamp: ""
        ),
        Post(
            avatarImageName: "woman",
            nickName: "mouse",
            imageNames: ["castle", "mountain", "canyon"],
            title: "",
            timeStamp: ""
        ),
        Post(
            avatarImageName: "woman",
            nickName: "mouse_cat",
            imageNames: ["mountain", "canyon"],
            title: "Горы Кавказа",
            timeStamp: ""
        ),
        Post(
            avatarImageName: "woman",
            nickName: "mouse_duck",
            imageNames: ["canyon", "mountain"],
            title: "Сулакский каньон",
            timeStamp: "b"
        )
    ]

    func getPosts(index: Int) -> Post {
        posts[index]
    }
}
