// Date+Extension.swift
// Copyright © RoadMap. All rights reserved.

//
//  Date+Extension.swift
//  UIKitHW
//
//  Created by Халимка on 21.02.2024.
//
import Foundation

/// Форматирует дату в строку
extension Date {
    /// - Parameter inputString: принимает строку
    /// - Returns: вернет дату
    static func dateFromCustomString(inputString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: inputString) ?? Date()
    }
}
