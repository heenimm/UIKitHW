// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
