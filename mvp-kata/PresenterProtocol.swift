//
//  PresenterProtocol.swift
//  mvp-kata
//
//  Created by Grzegorz Aperliński on 18.03.2017.
//  Copyright © 2017 Grzegorz Aperlinski. All rights reserved.
//

import Foundation

protocol PresenterProtocol {
  func attach(view: ViewProtocol)
}
