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
    return homeViewModel.models.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: HomeCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
    homeViewModel.currentItem = homeViewModel.models[indexPath.item]
    cell.viewModel = homeViewModel
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    guard !homeViewModel.models.isEmpty else { return }
    let lastIndex = homeViewModel.models.count - 1
    if indexPath.item == lastIndex {
      homeViewModel.fetchData()
    }
  }
}
