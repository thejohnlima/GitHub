//
//  UIView+Extensions.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import UIKit

protocol ReusableView: AnyObject {
  static var defaultReuseIdentifier: String { get }
}

protocol NIBLoadableView: AnyObject {
  static var nibName: String { get }
}

extension ReusableView where Self: UIView {
  static var defaultReuseIdentifier: String {
    return String(describing: self)
  }
}

extension NIBLoadableView where Self: UIView {
  static var nibName: String {
    return String(describing: self)
  }
}
