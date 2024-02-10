// Model.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Это модель которая получает слово и переворачивает его
struct WordModel {
    func getWord(word: String) -> String {
        String(word.reversed())
    }
}
