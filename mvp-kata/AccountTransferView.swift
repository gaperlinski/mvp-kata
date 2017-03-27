//
//  AccountTransferView.swift
//  mvp-kata
//
//  Created by Grzegorz Aperliński on 18.03.2017.
//  Copyright © 2017 Grzegorz Aperlinski. All rights reserved.
//

import Foundation

protocol AccountTransferView: ViewProtocol {
  func getTransferAmount() -> Double
  func setDisplayMessage(_ message: String)
}
