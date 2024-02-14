// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

///Расширения для работы с вью
extension UIView {
    ///Позволяет одновременно несколько сабвью добавлять на вью
    func addSubviews(_ view: UIView...) {
        view.forEach { self.addSubview($0) }
    }
}
