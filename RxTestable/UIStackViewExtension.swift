//
//  UIStackViewExtension.swift
//  RxTestable
//
//  Created by Alperen Duran on 3.02.2020.
//  Copyright © 2020 Alperen Duran. All rights reserved.
//

import UIKit

// MARK: - Create UIStackView
extension UIStackView {
    static func create(arrangedSubViews: [UIView] = [],
                       axis: NSLayoutConstraint.Axis = .vertical,
                       alignment: UIStackView.Alignment = .center,
                       distribution: UIStackView.Distribution = .equalSpacing,
                       spacing: CGFloat = .leastNormalMagnitude) -> UIStackView {

        let stackView = UIStackView(arrangedSubviews: arrangedSubViews)
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.spacing = spacing
        return stackView
    }
}
