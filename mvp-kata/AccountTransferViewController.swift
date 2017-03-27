//
//  ViewController.swift
//  mvp-kata
//
//  Created by Grzegorz Aperliński on 18.03.2017.
//  Copyright © 2017 Grzegorz Aperlinski. All rights reserved.
//

import UIKit

class AccountTransferViewController: UIViewController {
  
  let presenter = ServiceLocator.resolve(type: .accountTransfer) as? AccountTransferPresenter

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    presenter?.attach(view: self)
    presenter?.transferAmount()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension AccountTransferViewController: AccountTransferView {

  func getTransferAmount() -> Double {
    return 150
  }
  
  func setDisplayMessage(_ message: String) {
    print("Display message passed to view controller is \(message)")
  }
}
