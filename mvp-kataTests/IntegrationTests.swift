//
//  IntegrationTests.swift
//  mvp-kata
//
//  Created by Grzegorz Aperliński on 18.03.2017.
//  Copyright © 2017 Grzegorz Aperlinski. All rights reserved.
//

import XCTest
@testable import mvp_kata

class IntegrationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
  func testGivenPresenter_whenTransferAmountIsRequested_thenAllDelegatedProtocolsAreCalled() {
    // given
    let accountTransferView = PresenterTests.AccountTransferViewDouble()
    let remote = RemoteAccountRepository()
    let local = LocalAccountRepository()
    let sut = AccountTransferPresenter(remote: remote, local: local)
    sut.attach(view: accountTransferView)
    
    // when
    sut.transferAmount()
    
    // then
    XCTAssert(accountTransferView.setDepositMessageCalledCount == 1, "set deposit message not called")
    XCTAssert(accountTransferView.getTransferAmountCalledCount == 1, "get tranfer amount not called")
    XCTAssert(accountTransferView.displayMessage == "$150 transferred.", "display message wrong")
    XCTAssert(accountTransferView.getTransferAmount() == 150, "wrong amount")
  }
}
