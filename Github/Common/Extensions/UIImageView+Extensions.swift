//
//  UIImageView+Extensions.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import UIKit

extension UIImageView {
  func setImage(_ url: URL?) {
    guard let url = url else {
      image = nil
      return
    }
    URLSession.shared.dataTask(with: url) { data, _, error in
      DispatchQueue.main.async { [weak self] in
        guard let data = data, error == nil else {
          self?.image = nil
          return
        }
        let image = UIImage(data: data)
        self?.image = image
      }
    }.resume()
  }
}
