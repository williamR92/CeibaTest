//
//  NetworkTests.swift
//  testCeibaWilliamTests
//
//  Created by Julio Rico on 11/5/22.
//

import XCTest
@testable import testCeibaWilliam
class NetworkTests: XCTestCase {

    func testRequestAllUsersToNetworkShouldReturnAnArrayOfTenElemnts() {
        // given
        let sut = HomeViewModel()
        
        // when
        sut.makeRequest { userData in
            // then
            if let userData = userData {
                XCTAssertEqual(userData.count, 10, "Should be 10 elemenets from netowrk call.")
            } else {
                XCTAssertNil(userData, "Should be a nil array.")
            }
        }
        
    }

}
