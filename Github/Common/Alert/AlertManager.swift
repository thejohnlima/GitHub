//
//  AlertManager.swift
//  Github
//
//  Created by John Lima on 15/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import UIKit

class AlertManager {
  static func presentAlertWarning(target: UIViewController?,
                                  title: String = ErrorManager.error.description,
                                  message: String = ErrorManager.default.description) -> UIAlertController {
    let alert = UIAlertController(
      title: "☹︎ \(title)",
      message: message,
      preferredStyle: UIDevice.current.userInterfaceIdiom == .pad ? .alert : .actionSheet
    )

    DispatchQueue.main.async {
      target?.present(alert, animated: true)
    }

    return alert
  }
}
