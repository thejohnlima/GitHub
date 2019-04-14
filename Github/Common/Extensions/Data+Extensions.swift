//
//  Data+Extensions.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import Foundation

enum File {
  case github(FileType)

  var name: String {
    switch self {
    case .github:
      return "github"
    }
  }

  var type: String {
    switch self {
    case .github(let type):
      return type.rawValue
    }
  }
}

enum FileType: String {
  case json
}

extension Data {
  init(file: File, target: AnyClass) {
    if let url = Bundle(for: target).url(forResource: file.name, withExtension: file.type),
      let data = try? Data(contentsOf: url) {
      self = data
    } else {
      self = Data()
    }
  }
}
