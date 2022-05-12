//
//  HomeViewModel.swift
//  testCeibaWilliam
//
//  Created by Desarrollo MAC on 10/5/22.
//

import Foundation
import RealmSwift

protocol getDataProtocol {
    func loading()
    func hiddeLoading()
    func showData()
    func showError(message : String)
}

class HomeViewModel: NSObject {

    var delegate : getDataProtocol?

    private var apiService = APIService()

    private(set) var usersArray: [UserData]! {
        didSet {
            self.delegate?.showData()
        }
    }

    override init() {
        super.init()
    }

    func getApiData() {
        guard let elemenetsFromArray = readToRealm(displayMessage: false) else {
            // make request
            self.delegate?.loading()
            makeRequest(completion: handleResponse)
            return
        }
        usersArray = elemenetsFromArray
    }
    
    
    func makeRequest(completion: @escaping ([UserData]?) -> ()) {
        apiService.setURlService(urlString: "https://jsonplaceholder.typicode.com/users")
        apiService.apiToGetData { data  in
            do {
                let jsonDecoder = JSONDecoder()
                let listData = try jsonDecoder.decode([UserData].self, from: data)
                
                self.handleResponse(userData: listData)
            } catch {
                self.handleResponse(userData: nil)
            }
        }
    }
    
    private func handleResponse(userData: [UserData]?) {
        guard let userData = userData else {
            self.delegate?.showError(message: "Serialization Error")
            return
        }

        self.addUserToRealm(arrayUsers: userData)
        self.usersArray = self.readToRealm(displayMessage: false) ?? []
        self.delegate?.hiddeLoading()
    }

    func addUserToRealm(arrayUsers : [UserData]){
        let objRealm = try! Realm()
        let userRealm = UserRealm()
        for element in arrayUsers{
            userRealm.idUser = "\(element.id ?? 0)"
            userRealm.name = element.name ?? ""
            userRealm.email = element.email ?? ""
            userRealm.phone = element.phone ?? ""

            try! objRealm.write{
                objRealm.create(UserRealm.self, value: userRealm, update: .modified)
            }
        }

    }

    func readToRealm(displayMessage: Bool) -> [UserData]? {
        let objRealm = try! Realm()
        let realmResults = objRealm.objects(UserRealm.self)
        var users = [UserData]()
        var user : UserData = UserData()
        if(realmResults.count > 0){
            for element : UserRealm in realmResults {
                user.phone = element.phone
                user.email = element.email
                user.name = element.name
                user.id = Int(element.idUser)
                users.append(user)
            }
            return users
        }else{
            if displayMessage {
                self.delegate?.showError(message: "DataEmpty Error")
            }
            return nil
        }
    }
}

