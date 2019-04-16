//
//  UIView+Extensions.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import UIKit

private let loadNibError = "Could not load view from nib"

extension UIView {
  static var identifier: String { return String(describing: self) }
  
  static func fromNib<T: UIView>() -> T {
    guard let result = Bundle.main.loadNibNamed(T.identifier, owner: nil, options: nil)?.first as? T else {
      fatalError("\(loadNibError): \(T.identifier)")
    }
    return result
  }

  func addShadow(rounded: Bool = false,
                 roundedValue: CGFloat? = nil,
                 fillColor: UIColor = .black,
                 shadowColor: UIColor = .black,
                 shadowOffset: CGSize = CGSize(width: 0.0, height: 3.0),
                 shadowOpacity: Float = 0.4,
                 shadowRadius: CGFloat = 3.0,
                 toIndex: UInt32 = 0) {

    if layer.sublayers?.first(where: { $0 is CAShapeLayer }) == nil {
      let shadowLayer = CAShapeLayer()

      shadowLayer.fillColor = fillColor.cgColor
      shadowLayer.shadowColor = shadowColor.cgColor
      shadowLayer.shadowOffset = shadowOffset
      shadowLayer.shadowOpacity = shadowOpacity
      shadowLayer.shadowRadius = shadowRadius

      if rounded {
        let cornerRadius = roundedValue ?? bounds.height / 2
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
      }

      shadowLayer.shadowPath = shadowLayer.path

      layer.insertSublayer(shadowLayer, at: toIndex)
    }
  }
}
