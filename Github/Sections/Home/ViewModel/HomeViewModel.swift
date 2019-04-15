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

  // MARK: - Constants
  let alertActionImageKey = "image"
  let alertActionTitleTextColorKey = "titleTextColor"
  let timeIntervalToDismissAlert: TimeInterval = 3
  let initialPage = 1
  let pageIncrement = 1

  // MARK: - Properties
  let observable: OKObservable<OKState<[Repository]>> = OKObservable(.loading)
  var service = HomeService()
  var models: [Repository] = []
  var currentItem: Repository?
  var completionFetch: ((OKState<[Repository]>) -> Void)?
  var pageIndex = 1

  // MARK: - Public Methods
  func fetchData() {
    if pageIndex == initialPage {
      models = []
    }
    observable.value = .loading
    service.fetchData(with: pageIndex) { result, error in
      guard let result = result else {
        if !self.models.isEmpty {
          self.observable.value = .load(data: self.models)
        } else {
          self.observable.value = .errored(error: error ?? ErrorManager.default)
        }
        return
      }
      self.models.append(contentsOf: result)
      self.pageIndex += self.pageIncrement
      self.observable.value = .load(data: result)
    }
  }
}
