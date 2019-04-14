//
//  HomeService.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import BaseNetworkKit
import Foundation

class HomeService: NKBaseService<HomeAPI> {
  func fetchData(completion: @escaping NKCommon.Completion<HomeModel>) {
    fetch(.fetch, dataType: HomeModel.self) { model, _, error in
      completion(model, error)
    }
  }
}
