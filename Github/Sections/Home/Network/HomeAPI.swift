//
//  HomeAPI.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import BaseNetworkKit
import Foundation

enum HomeAPI {
  case fetch
}

extension HomeAPI: NKFlowTarget {
  var baseURL: URL {
    switch self {
    case .fetch:
      return URL(stringValue: "https://api.github.com/")
    }
  }

  var path: String {
    switch self {
    case .fetch:
      return "repositories"
    }
  }

  var method: NKHTTPMethods {
    switch self {
    case .fetch:
      return .get
    }
  }

  var task: NKTask {
    switch self {
    case .fetch:
      let params = ["q": "language:swift", "sort": "stars"]
      return .requestParameters(params, encoding: .queryString)
    }
  }

  var environment: NKEnvironment {
    return .develop
  }
}
