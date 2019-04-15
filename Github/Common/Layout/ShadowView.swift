//
//  ShadowView.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import UIKit

class ShadowView: UIView {

  // MARK: - Properties
  private var shadowLayer: CAShapeLayer?

  var cornerRadius: CGFloat = 0
  var shadowOffset = CGSize(width: 0, height: 1)
  var shadowOpacity: Float = 0.4
  var shadowRadius: CGFloat = 2
  var indexOfLayer = 0
  var shadowColor = UIColor.black.cgColor
  var layerFillColor = UIColor.white.cgColor

  // MARK: - Overrides
  override public class var layerClass: Swift.AnyClass {
    return CAShapeLayer.self
  }

  override func layoutSubviews() {

    for layer in layer.sublayers ?? [] {
      if layer.isEqual(shadowLayer) {
        layer.removeFromSuperlayer()
      }
    }

    shadowLayer = CAShapeLayer()

    guard let shadowLayer = shadowLayer else { return }

    shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    shadowLayer.fillColor = layerFillColor

    shadowLayer.shadowColor = shadowColor
    shadowLayer.shadowPath = shadowLayer.path
    shadowLayer.shadowOffset = shadowOffset
    shadowLayer.shadowOpacity = shadowOpacity
    shadowLayer.shadowRadius = shadowRadius

    self.shadowLayer = shadowLayer

    layer.insertSublayer(shadowLayer, at: UInt32(indexOfLayer))
  }
}
