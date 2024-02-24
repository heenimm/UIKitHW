// UIButton+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Добавила собственную инициализацию, с дополнительными параметрами
extension UIButton {
    /// - Parameter inputString: принимает ширифт, размер шрифта и отображаемый текст
    /// - Returns: возвращает сконфигурированную по нашим параметрам кнопку
    convenience init(font: String, textSize: CGFloat, textTitle: String) {
        self.init(frame: .zero)
        backgroundColor = UIColor(named: "AppButtunGrey")
        setTitle(textTitle, for: .normal)
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 7
        titleLabel?.font = UIFont(name: font, size: textSize)
        clipsToBounds = true
    }
}
