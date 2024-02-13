// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ view: UIView...) {
        view.forEach { self.addSubview($0) }
    }
}
