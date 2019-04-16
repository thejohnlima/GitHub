//
//  HomeCollectionViewCell.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import SwiftIconFont
import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

  // MARK: - Constants
  private let iconFontSize: CGFloat = 18
  private let forksFontSize: CGFloat = 15
  private let starFontSize: CGFloat = 15
  private let starIcon = String.fontAwesomeIcon("star") ?? ""
  private let forksRepoIcon = String.fontOcticon("repo-forked") ?? ""

  // MARK: - Properties
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var authorPhotoImageView: UIImageView!
  @IBOutlet weak var authorNameLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var starsLabel: UILabel!
  @IBOutlet weak var forksLabel: UILabel!

  static var height: CGFloat {
    return 160
  }

  // MARK: - Overrides
  override func awakeFromNib() {
    super.awakeFromNib()
    updateUI()
  }

  // MARK: - Public Methods
  func configure(_ repository: HomeModel.Repository) {
    nameLabel.text = repository.name
    authorNameLabel.text = repository.author.name
    descriptionLabel.text = repository.description

    setStarLabel(with: repository.stars)
    setForksLabel(with: repository.forks)

    authorPhotoImageView.setImage(URL(string: repository.author.avatar))
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
    let iconAttributes = [NSAttributedString.Key.font: UIFont.icon(from: .octicon, ofSize: iconFontSize)]
    let attributedText = NSMutableAttributedString(string: "\(forksRepoIcon)", attributes: iconAttributes)

    let rightText = !forksRepoIcon.isEmpty ? ": \(forks)" : "\(forks)"
    let rightAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: forksFontSize, weight: .medium)]
    let rightAttributed = NSAttributedString(string: rightText, attributes: rightAttributes)

    attributedText.append(rightAttributed)

    forksLabel.attributedText = attributedText
  }

  private func updateUI() {
    containerView.addShadow(
      rounded: true,
      roundedValue: 7,
      fillColor: #colorLiteral(red: 0.1882352941, green: 0.1921568627, blue: 0.2039215686, alpha: 1),
      shadowOffset: .zero,
      shadowOpacity: 0.3
    )
  }
}
