// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
