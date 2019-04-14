//
//  HomeViewModel.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import Foundation
import ObservableKit

class HomeViewModel {

  // MARK: - Properties
  let observable: OKObservable<OKState<HomeModel>> = OKObservable(.loading)
  var service = HomeService()
  var model: HomeModel?

  // MARK: - Public Methods
  func fetchData() {
    observable.value = .loading
    service.fetchData { result, error in
      guard let result = result else {
        self.observable.value = .errored(error: error ?? ErrorManager.default)
        return
      }
      self.model = result
      self.observable.value = .load(data: result)
    }
  }
}
