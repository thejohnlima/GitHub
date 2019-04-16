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
  let observable: OKObservable<OKState<HomeModel>> = OKObservable(.loading)
  var service = HomeService()
  var model = HomeModel(items: [])
  var completionFetch: ((OKState<HomeModel>) -> Void)?
  var currentPage = 1

  private var isFetchInProgress = false

  var currentCount: Int {
    return model.items.count
  }

  // MARK: - Public Methods
  func repository(at index: Int) -> HomeModel.Repository {
    return model.items[index]
  }

  func fetchData() {
    guard !isFetchInProgress else { return }

    isFetchInProgress = true

    if currentPage == initialPage {
      clearData()
    }

    observable.value = .loading

    DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1) {
      self.service.fetchData(with: self.currentPage) { result, error in
        self.isFetchInProgress = false

        guard let result = result else {
          self.observable.value = .errored(error: error ?? ErrorManager.default)
          return
        }

        self.currentPage += self.pageIncrement
        self.model.items.append(contentsOf: result.items)
        self.observable.value = .load(data: result)
      }
    }
  }
  
  func clearData() {
    model = HomeModel(items: [])
  }
}
