//
//  ErrorManager.swift
//  Github
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import BaseNetworkKit
import Foundation

enum ErrorManager: Error, CustomStringConvertible {
  case error
  case connection
  case initClass
  case `default`

  var description: String {
    switch self {
    case .error:
      return "Erro"
    case .connection:
      return "Erro de rede"
    case .initClass:
      return "Erro de inicialização"
    case .default:
      return "Algo deu errado, tente novamente."
    }
  }
}

extension Error {
  var description: String {
    if let error = self as? ErrorManager {
      return error.description
    } else if let nkError = self as? NKError {
      return nkError.localizedDescription
    }
    return self.localizedDescription
  }
}
