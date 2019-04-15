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
}
