// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для UIView которое позволяет добавлять несколько вью в одном метода
public extension UIView {
    ///
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { self.addSubview($0) }
    }
}
