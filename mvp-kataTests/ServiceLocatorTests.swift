//
//  ServiceLocatorTests.swift
//  mvp-kata
//
//  Created by Grzegorz Aperliński on 18.03.2017.
//  Copyright © 2017 Grzegorz Aperlinski. All rights reserved.
//

import XCTest
@testable import mvp_kata

class ServiceLocatorTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testGivenSut_whenResolveMethodIsPassedAnEnum_thenTheMAtchingTypeIsInstantiated() {
    let presenterType: PresenterType = .accountTransfer
    
    let presenter = ServiceLocator.resolve(type: presenterType)
    
    XCTAssert(presenter is AccountTransferPresenter, "wrong presenter returned")
  }
  
}
