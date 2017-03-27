//
//  ServiceLocator.swift
//  mvp-kata
//
//  Created by Grzegorz Aperliński on 18.03.2017.
//  Copyright © 2017 Grzegorz Aperlinski. All rights reserved.
//

import Foundation

class ServiceLocator {
  
  static func resolve(type: PresenterType) -> PresenterProtocol {
    switch type {
    case .accountTransfer:
      return createAccountTransferPresenter()
    default:
      return 0 as! PresenterProtocol
    }
  }
  
  static func createAccountTransferPresenter() -> AccountTransferPresenter {
    let remote = RemoteAccountRepository()
    let local = LocalAccountRepository()
    let presenter = AccountTransferPresenter(remote: remote, local: local)
    return presenter
  }
}
