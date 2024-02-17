// String+Extension.swift
// Copyright © RoadMap. All rights reserved.

public extension String {
    var isValidEmail: Bool {
        range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: .regularExpression) != nil
    }
}
