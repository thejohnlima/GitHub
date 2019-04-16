//
//  HomeView+Extensions.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import UIKit

// MARK: - UICollectionViewDataSource and UICollectionViewDelegate
extension HomeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return homeViewModel.currentCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return collectionView.dequeueReusableCell(of: HomeCollectionViewCell.self, for: indexPath) { cell in
      if !self.isLoadingCell(for: indexPath) {
        cell.configure(self.homeViewModel.repository(at: indexPath.item))
      }
    }
  }
}

// MARK: - UICollectionViewDataSourcePrefetching
extension HomeViewController: UICollectionViewDataSourcePrefetching {
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
    if indexPaths.contains(where: isLoadingCell) {
      homeViewModel.fetchData()
    }
  }
}
