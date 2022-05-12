//
//  User.swift
//  testCeibaWilliam
//
//  Created by Desarrollo MAC on 10/5/22.
//

import Foundation
import RealmSwift

// MARK: - UserData
struct UserData: Codable {
    var id: Int?
    var name, username, email: String?
    var address: Address?
    var phone, website: String?
    var company: Company?
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String?
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String?
}

extension UserData {
    static func example() -> UserData {
        UserData(id: 1, name: "Test", username: "Username", email: "mail@mail.com", address: Address(street: "Street", suite: "Suite", city: "City", zipcode: "12345", geo: Geo(lat: "13.83", lng: "-89.94")), phone: "77223344", website: "https://apple.com", company: Company(name: "Company", catchPhrase: "Catch phrase", bs: "BS"))
    }
}
