//
//  ColumnFlowLayout.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import UIKit

// MARK: - Constants
private let defaultItemHeight: CGFloat = 50
private let defaultMinColumnWidth: CGFloat = 275
private let layoutInsets = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
private let minLineSpacing: CGFloat = 8
private let minInteritemSpacing: CGFloat = 0
private let numberOfColumns: Int = 3

class ColumnFlowLayout: UICollectionViewFlowLayout {

  // MARK: - Properties
  var itemHeight: CGFloat = defaultItemHeight

  // MARK: - Overrides
  override func prepare() {
    super.prepare()
    updateLayout()
  }

  // MARK: - Private Methods
  private func updateLayout() {
    guard let collectionView = collectionView else { return }

    sectionInset = layoutInsets

    let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).size.width
    let minColumnWidth = defaultMinColumnWidth
    let maxNumberOfColumns = Int(availableWidth / minColumnWidth)
    let cellWidth = (availableWidth / CGFloat(maxNumberOfColumns)).rounded(.down)
    var size = CGSize(width: cellWidth, height: itemHeight)

    if UIDevice.current.userInterfaceIdiom == .pad {
      let screenWidth = UIScreen.main.bounds.width
      let cellSpacing = minimumInteritemSpacing
      let leftRightMargin = layoutInsets.left
      let numColumns = CGFloat(numberOfColumns)
      let totalCellSpace = cellSpacing * (numColumns - 1)
      let width = (screenWidth - leftRightMargin - totalCellSpace) / numColumns

      size = CGSize(width: width, height: itemHeight)

      sectionInset.left = CGFloat()
      sectionInset.right = CGFloat()
    }

    itemSize = size
    minimumLineSpacing = minLineSpacing
    minimumInteritemSpacing = minInteritemSpacing

    if #available(iOS 11.0, *) {
      sectionInsetReference = .fromSafeArea
    }
  }
}
