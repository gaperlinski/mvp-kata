//
//  mvp_kataTests.swift
//  mvp-kataTests
//
//  Created by Grzegorz Aperliński on 18.03.2017.
//  Copyright © 2017 Grzegorz Aperlinski. All rights reserved.
//

import XCTest
@testable import mvp_kata

class PresenterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
  
  // Testing doubles
  
  class AccountTransferViewDouble: AccountTransferView {
    
    // call expectations
    var getTransferAmountCalledCount = 0
    var setDepositMessageCalledCount = 0
    
    // parameter expectations
    var displayMessage: String!
    
    func getTransferAmount() -> Double {
      getTransferAmountCalledCount += 1
      return 150
    }
    
    func setDisplayMessage(_ message: String) {
      setDepositMessageCalledCount += 1
      displayMessage = message
    }
  }
  
  class RemoteAccountRepositoryDouble: RemoteAccountRepositoryProtocol {
  
    // call expectations
    var withdrawCalledCount = 0
    
    // parameter expectations
    var withdrawAmount: Double!
    
    func withdraw(amount: Double) {
      withdrawCalledCount += 1
      withdrawAmount = amount
    }
    
  }
  
  class LocalAccountRepositoryDouble: LocalAccountRepositoryProtocol {
    
    var depositCalledCount = 0
    
    // parameter expectations
    var depositAmount: Double!
    
    func deposit(amount: Double) {
      depositCalledCount += 1
      depositAmount = amount
    }
  }
    
  func testGivenPresenter_whenTransferAmountIsRequested_thenAllDelegatedProtocolsAreCalled() {
    // given
    let accountTransferView = AccountTransferViewDouble()
    let remoteAccountRepository = RemoteAccountRepositoryDouble()
    let localAccountRepository = LocalAccountRepositoryDouble()
    let sut = AccountTransferPresenter(remote: remoteAccountRepository, local: localAccountRepository)
    sut.attach(view: accountTransferView)
    
    // when
    sut.transferAmount()
    
    // then
    XCTAssert(accountTransferView.setDepositMessageCalledCount == 1, "set deposit message not called")
    XCTAssert(accountTransferView.getTransferAmountCalledCount == 1, "get tranfer amount not called")
    XCTAssert(accountTransferView.displayMessage == "$150 transferred.", "display message wrong")
    XCTAssert(accountTransferView.getTransferAmount() == 150, "wrong amount")
    XCTAssert(remoteAccountRepository.withdrawCalledCount == 1, "withdraw not callled")
    XCTAssert(remoteAccountRepository.withdrawAmount == 150, "withdraw amount wrong")
    XCTAssert(localAccountRepository.depositCalledCount == 1, "deposit not callled")
    XCTAssert(localAccountRepository.depositAmount == 150, "deposit amount wrong")
  }
}
