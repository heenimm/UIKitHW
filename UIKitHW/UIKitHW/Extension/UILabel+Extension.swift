// UILabel+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

//////Добавила собственную инициализацию, с дополнительными параметрами
extension UILabel {
    /// - Parameter inputString: принимает ширифт, размер шрифта и отображаемый текст
    /// - Returns: возвращает сконфигурированную по нашим параметрам метку
    convenience init(font: String, textSize: CGFloat, textTitle: String) {
        self.init(frame: .zero)
        text = textTitle
        textAlignment = .center
        self.font = UIFont(name: font, size: textSize)
    }
}
