//
//  AccountTranferPresenter.swift
//  mvp-kata
//
//  Created by Grzegorz Aperliński on 18.03.2017.
//  Copyright © 2017 Grzegorz Aperlinski. All rights reserved.
//

import Foundation

class AccountTransferPresenter: PresenterProtocol {
  
  private let remote: RemoteAccountRepositoryProtocol
  private let local: LocalAccountRepositoryProtocol
  private weak var accountTransferView: AccountTransferView?

  required init(remote: RemoteAccountRepositoryProtocol, local: LocalAccountRepositoryProtocol) {
    self.remote = remote
    self.local = local
  }
  
  func attach(view: ViewProtocol) {
    accountTransferView = view as? AccountTransferView
  }
  
  func transferAmount() {
    guard let amount = accountTransferView?.getTransferAmount() else { return }
    remote.withdraw(amount: amount)
    local.deposit(amount: amount)
    accountTransferView?.setDisplayMessage("$" + String(format: "%.0f", amount) + " transferred.")
  }
}
