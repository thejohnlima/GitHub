//
//  HomeViewController.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  // MARK: - Properties
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
  
  let homeViewModel: HomeViewModel
  var alertController: UIAlertController?
  var pullRefresh = UIRefreshControl()
  
  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    initialize()
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  // MARK: - Initializers
  init(_ homeViewModel: HomeViewModel = HomeViewModel()) {
    self.homeViewModel = homeViewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError(ErrorManager.initClass.description)
  }
  
  // MARK: - Private Methods
  private func initialize() {
    updateUI()
    addObservable()
    homeViewModel.fetchData()
  }
  
  private func updateUI() {
    let layout = ColumnFlowLayout()
    layout.itemHeight = HomeCollectionViewCell.height
    collectionView.collectionViewLayout = layout
    registerCells()
    createPullRefresh()
  }
  
  private func registerCells() {
    collectionView.register(HomeCollectionViewCell.self)
  }
  
  private func addObservable() {
    homeViewModel.observable.didChange = { [weak self] state in
      DispatchQueue.main.async {
        switch state {
        case .loading:
          if self?.pullRefresh.isRefreshing == false {
            self?.activityIndicatorView.startAnimating()
          }
        case .load:
          self?.didLoadData()
        case .errored(error: let error):
          self?.present(error: error)
        default:
          self?.activityIndicatorView.stopAnimating()
          self?.pullRefresh.endRefreshing()
        }
        self?.homeViewModel.completionFetch?(state)
      }
    }
  }
  
  private func didLoadData() {
    activityIndicatorView.stopAnimating()
    pullRefresh.endRefreshing()
    collectionView.reloadData()
  }
  
  private func present(error: Error) {
    activityIndicatorView.stopAnimating()
    pullRefresh.endRefreshing()
    if alertController == nil {
      alertController = AlertManager.presentAlertWarning(target: self)
      Timer.scheduledTimer(
        timeInterval: homeViewModel.timeIntervalToDismissAlert,
        target: self,
        selector: #selector(dismissAlertWarning(sender:)),
        userInfo: nil,
        repeats: false
      )
    }
  }
  
  private func createPullRefresh() {
    pullRefresh.tintColor = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    pullRefresh.addTarget(self, action: #selector(refresh), for: .valueChanged)
    collectionView.refreshControl = pullRefresh
  }
  
  @objc
  private func refresh() {
    homeViewModel.pageIndex = homeViewModel.initialPage
    homeViewModel.clearData()
    collectionView.reloadData()
    homeViewModel.fetchData()
  }
  
  @objc
  private func dismissAlertWarning(sender: Timer) {
    alertController?.dismiss(animated: true) { [weak self] in
      self?.alertController = nil
      sender.invalidate()
    }
  }
}
