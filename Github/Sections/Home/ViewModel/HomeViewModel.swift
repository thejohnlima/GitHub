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
  let initialPage = 0
  let pageIncrement = 1

  // MARK: - Properties
  let observable: OKObservable<OKState<HomeModel>> = OKObservable(.loading)
  var service = HomeService()
  var model = HomeModel(items: [])
  var currentItem: HomeModel.Repository?
  var completionFetch: ((OKState<HomeModel>) -> Void)?
  var pageIndex = 0

  // MARK: - Public Methods
  func fetchData() {
    if pageIndex == initialPage {
      clearData()
    }
    observable.value = .loading
    service.fetchData(with: pageIndex) { result, error in
      guard let result = result else {
        if !self.model.items.isEmpty {
          self.observable.value = .load(data: self.model)
        } else {
          self.observable.value = .errored(error: error ?? ErrorManager.default)
        }
        return
      }
      self.model.items.append(contentsOf: result.items)
      self.pageIndex += self.pageIncrement
      self.observable.value = .load(data: result)
    }
  }
  
  func clearData() {
    model = HomeModel(items: [])
  }
}
