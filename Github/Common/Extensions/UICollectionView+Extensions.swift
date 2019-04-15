//
//  UICollectionView+Extensions.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import UIKit

private let errorDequeueCellIdenfier = "Could not dequeue cell with identifier"

extension UICollectionView {
  func register(_ cell: UICollectionViewCell.Type) {
    let nib = UINib(nibName: cell.identifier, bundle: nil)
    register(nib, forCellWithReuseIdentifier: cell.identifier)
  }
  
  public func registerHeader(_ reusableView: UICollectionReusableView.Type) {
    let nib = UINib(nibName: reusableView.identifier, bundle: nil)
    register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reusableView.identifier)
  }
  
  public func registerFooter(_ reusableView: UICollectionReusableView.Type) {
    let nib = UINib(nibName: reusableView.identifier, bundle: nil)
    register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: reusableView.identifier)
  }
  
  func dequeueReusableCell<T: UICollectionViewCell>(of class: T.Type,
                                                    for indexPath: IndexPath,
                                                    configure: @escaping ((T) -> Void) = { _ in }) -> UICollectionViewCell {
    let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath)
    if let typedCell = cell as? T {
      configure(typedCell)
    }
    return cell
  }
  
  func dequeueReusableHeader<T: UICollectionReusableView>(of class: T.Type,
                                                          for indexPath: IndexPath,
                                                          configure: @escaping (T) -> Void = { _ in }) -> UICollectionReusableView {
    let header = dequeueReusableSupplementaryView(
      ofKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: T.identifier,
      for: indexPath
    )
    
    if let headerCell = header as? T {
      configure(headerCell)
    }
    
    return header
  }
  
  func dequeueReusableFooter<T: UICollectionReusableView>(of class: T.Type,
                                                          for indexPath: IndexPath,
                                                          configure: @escaping (T) -> Void = { _ in }) -> UICollectionReusableView {
    let footer = dequeueReusableSupplementaryView(
      ofKind: UICollectionView.elementKindSectionFooter,
      withReuseIdentifier: T.identifier,
      for: indexPath
    )
    
    if let footerCell = footer as? T {
      configure(footerCell)
    }
    
    return footer
  }
}
