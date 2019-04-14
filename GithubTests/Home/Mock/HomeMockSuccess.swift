//
//  HomeMockSuccess.swift
//  GithubTests
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import Foundation
@testable import Github

class HomeMockSuccess {
  static func getModel() -> HomeModel? {
    let data = Data(file: .github(.json), target: HomeMockSuccess.self)
    let model = HomeModel(data)
    return model
  }
}
