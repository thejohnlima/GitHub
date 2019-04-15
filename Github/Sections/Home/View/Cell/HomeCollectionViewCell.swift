//
//  HomeCollectionViewCell.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import SwiftIconFont
import UIKit

class HomeCollectionViewCell: UICollectionViewCell, ReusableView, NIBLoadableView {

  // MARK: - Constants
  private let iconFontSize: CGFloat = 18
  private let forksFontSize: CGFloat = 15
  private let starFontSize: CGFloat = 15
  private let starIcon = String.fontAwesomeIcon(UIFont.FontIcon.FontAwesome.star) ?? String()
  private let forksRepoIcon = String.fontIonIcon(UIFont.FontIcon.FontIon.forkRepo) ?? String()
  private let optionsIcon = String.fontAwesomeIcon(UIFont.FontIcon.FontAwesome.options) ?? String()

  // MARK: - Properties
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var authorPhotoImageView: UIImageView!
  @IBOutlet weak var authorNameLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var starsLabel: UILabel!
  @IBOutlet weak var forksLabel: UILabel!
  @IBOutlet weak var optionsButton: UIButton!

  var viewModel: HomeViewModel? {
    didSet {
      guard let item = viewModel?.currentItem else { return }

      nameLabel.text = item.name
      authorNameLabel.text = item.author.name
      descriptionLabel.text = item.description

      setStarLabel(with: item.stars)
      setForksLabel(with: item.forks)

      authorPhotoImageView.setImage(URL(string: item.author.avatar))
    }
  }

  static var height: CGFloat {
    return 160
  }

  // MARK: - Overrides
  override func awakeFromNib() {
    super.awakeFromNib()
    updateUI()
  }

  // MARK: - Private Methods
  private func setStarLabel(with stars: Int) {

    let iconAttributes = [NSAttributedString.Key.font: UIFont.icon(from: .fontAwesome, ofSize: iconFontSize)]
    let attributedText = NSMutableAttributedString(string: "\(starIcon)", attributes: iconAttributes)

    let rightText = !starIcon.isEmpty ? ": \(stars)" : "\(stars)"
    let rightAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: starFontSize, weight: .medium)]
    let rightAttributed = NSAttributedString(string: rightText, attributes: rightAttributes)

    attributedText.append(rightAttributed)

    starsLabel.attributedText = attributedText
  }

  private func setForksLabel(with forks: Int) {

    let iconAttributes = [NSAttributedString.Key.font: UIFont.icon(from: .ionicon, ofSize: iconFontSize)]
    let attributedText = NSMutableAttributedString(string: "\(forksRepoIcon)", attributes: iconAttributes)

    let rightText = !forksRepoIcon.isEmpty ? ": \(forks)" : "\(forks)"
    let rightAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: forksFontSize, weight: .medium)]
    let rightAttributed = NSAttributedString(string: rightText, attributes: rightAttributes)

    attributedText.append(rightAttributed)

    forksLabel.attributedText = attributedText
  }

  private func updateUI() {
    optionsButton.titleLabel?.font = UIFont.icon(from: .fontAwesome, ofSize: iconFontSize)
    optionsButton.setTitle(optionsIcon, for: .normal)
  }
}
