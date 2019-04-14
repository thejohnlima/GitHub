//
//  HomeModel.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import BaseNetworkKit
import Foundation

struct HomeModel: NKCodable {
  let repositories: [Repository]

  struct Repository: NKCodable {
    let name: String
    let description: String
    let stars: Int
    let forks: Int
    let author: Author

    private enum CodingKeys: String, CodingKey {
      case name, description, forks
      case stars = "stargazers_count"
      case author = "owner"
    }
  }

  private enum CodingKeys: String, CodingKey {
    case repositories = "items"
  }
}

extension HomeModel.Repository {
  struct Author: NKCodable {
    let name: String
    let avatar: String

    private enum CodingKeys: String, CodingKey {
      case name = "login"
      case avatar = "avatar_url"
    }
  }
}
