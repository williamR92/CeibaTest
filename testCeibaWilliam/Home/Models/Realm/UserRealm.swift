//
//  UserRealm.swift
//  testCeibaWilliam
//
//  Created by Desarrollo MAC on 11/5/22.
//

import Foundation
import RealmSwift

class UserRealm: Object, Codable{
    @objc dynamic var idUser = ""
    @objc dynamic var name = ""
    @objc dynamic var phone = ""
    @objc dynamic var email = ""

    override static func primaryKey() -> String?{
        return "idUser"
    }
}

