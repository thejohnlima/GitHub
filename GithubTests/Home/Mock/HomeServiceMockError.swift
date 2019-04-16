//
//  HomeServiceMockError.swift
//  GithubTests
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import BaseNetworkKit
import Foundation
@testable import Github

class HomeServiceMockError: HomeService {
  override func fetchData(with page: Int, completion: @escaping NKCommon.Completion<HomeModel>) {
    completion(nil, ErrorManager.default)
  }
}
