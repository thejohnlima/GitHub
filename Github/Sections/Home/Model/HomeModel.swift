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
  var items: [Repository]
  
  struct Repository: NKCodable {
    let id: Int
    let name: String
    let description: String
    let stars: Int
    let forks: Int
    let author: Author
    
    struct Author: NKCodable {
      let name: String
      let avatar: String
      
      private enum CodingKeys: String, CodingKey {
        case name = "login"
        case avatar = "avatar_url"
      }
    }
    
    private enum CodingKeys: String, CodingKey {
      case id, name, description, forks
      case stars = "stargazers_count"
      case author = "owner"
    }
  }
}

extension HomeModel.Repository: Equatable {
  static func == (lhs: HomeModel.Repository, rhs: HomeModel.Repository) -> Bool {
    return lhs.id == rhs.id
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

extension Collection {
  func noDuplicates() -> [HomeModel.Repository] {
    let models = (self as? [HomeModel.Repository] ?? [])
    var result = [HomeModel.Repository]()
    for model in models {
      let duplicates = result.first { $0.id == model.id }
      if duplicates == nil {
        result.append(model)
      }
    }
    return result
  }
}
