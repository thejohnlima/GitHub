//
//  HomeModel.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import BaseNetworkKit
import Foundation

struct Repository: NKCodable {
  let id: Int
  let name: String
  let description: String
  let stars: Int
  let forks: Int
  let author: Author

  private enum CodingKeys: String, CodingKey {
    case id, name, description, forks
    case stars = "stargazers_count"
    case author = "owner"
  }
}

extension Repository {
  struct Author: NKCodable {
    let name: String
    let avatar: String

    private enum CodingKeys: String, CodingKey {
      case name = "login"
      case avatar = "avatar_url"
    }
  }
}

extension Repository: Equatable {
  static func == (lhs: Repository, rhs: Repository) -> Bool {
    return lhs.id == rhs.id
      && lhs.name == rhs.name
      && lhs.description == rhs.description
      && lhs.stars == rhs.stars
      && lhs.forks == rhs.forks
      && lhs.author == rhs.author
  }
}

extension Repository.Author: Equatable {
  static func == (lhs: Repository.Author, rhs: Repository.Author) -> Bool {
    return lhs.name == rhs.name
      && lhs.avatar == rhs.avatar
  }
}

extension Collection {
  func noDuplicates() -> [Repository] {
    let models = (self as? [Repository] ?? [])
    var result = [Repository]()
    for model in models {
      let duplicates = result.first { $0.id == model.id }
      if duplicates == nil {
        result.append(model)
      }
    }
    return result
  }
}
