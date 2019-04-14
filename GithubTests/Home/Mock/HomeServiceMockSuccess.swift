//
//  HomeServiceMockSuccess.swift
//  GithubTests
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import BaseNetworkKit
import Foundation
@testable import Github

class HomeServiceMockSuccess: HomeService {
  override func fetchData(completion: @escaping NKCommon.Completion<HomeModel>) {
    let data = Data(file: .github(.json), target: HomeServiceMockSuccess.self)
    let model = HomeModel(data)
    completion(model, nil)
  }
}
