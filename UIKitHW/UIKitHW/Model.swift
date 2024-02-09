// Model.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

struct WordModel {
    func getWord(word: String) -> String {
        String(word.reversed())
    }
}
