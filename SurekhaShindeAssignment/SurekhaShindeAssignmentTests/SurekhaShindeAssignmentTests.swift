//
//  SurekhaShindeAssignmentTests.swift
//  SurekhaShindeAssignmentTests
//
//  Created by sride on 08/01/19.
//  Copyright © 2019 sride. All rights reserved.
//

import XCTest
@testable import SurekhaShindeAssignment

class SurekhaShindeAssignmentTests: XCTestCase {
    let viewController = ViewController()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPrimeNum() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
      let status =   viewController.isPrime(19)
        XCTAssertTrue(status)
    }

    func testNonPrime(){
        let status =   viewController.isPrime(9)
        XCTAssertFalse(status)
    }

    func testGetData(){
        
    }
}
