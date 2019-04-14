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

extension HomeModel: Equatable {
  static func == (lhs: HomeModel, rhs: HomeModel) -> Bool {
    return lhs.repositories == rhs.repositories
  }
}

extension HomeModel.Repository: Equatable {
  static func == (lhs: HomeModel.Repository, rhs: HomeModel.Repository) -> Bool {
    return lhs.name == rhs.name
      && lhs.name == rhs.name
      && lhs.description == rhs.description
      && lhs.stars == rhs.stars
      && lhs.forks == rhs.forks
      && lhs.author == rhs.author
  }
}

extension HomeModel.Repository.Author: Equatable {
  static func == (lhs: HomeModel.Repository.Author, rhs: HomeModel.Repository.Author) -> Bool {
    return lhs.name == rhs.name
      && lhs.avatar == rhs.avatar
  }
}
