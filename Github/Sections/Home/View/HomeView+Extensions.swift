//
//  HomeView+Extensions.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import UIKit

// MARK: - UICollectionViewDataSource and UICollectionViewDelegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return homeViewModel.model.items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return collectionView.dequeueReusableCell(of: HomeCollectionViewCell.self, for: indexPath) { cell in
      guard !self.homeViewModel.model.items.isEmpty else { return }
      self.homeViewModel.currentItem = self.homeViewModel.model.items[indexPath.item]
      cell.viewModel = self.homeViewModel
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    guard !homeViewModel.model.items.isEmpty else { return }
    let lastIndex = homeViewModel.model.items.count - 1
    if indexPath.item == lastIndex {
      homeViewModel.fetchData()
    }
  }
}
