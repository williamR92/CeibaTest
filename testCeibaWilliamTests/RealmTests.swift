//
//  RealmTests.swift
//  testCeibaWilliamTests
//
//  Created by Desarrollo MAC on 10/5/22.
//

import XCTest
@testable import testCeibaWilliam
class RealmTests: XCTestCase {

    func testAddUserDataToRealmShouldReturnAnElement() {
        // given
        // system under test
        let sut = HomeViewModel()
        let originalDataFromRealm = (sut.readToRealm(displayMessage: false) ?? []).count
        var mockData = UserData.example()
        mockData.id = originalDataFromRealm + 1
        
        // when
        sut.addUserToRealm(arrayUsers: [mockData])
        
        // then
        XCTAssertEqual((sut.readToRealm(displayMessage: false) ?? []).count, originalDataFromRealm + 1, "Array of User Data should have added one element to array.")
    }

}
