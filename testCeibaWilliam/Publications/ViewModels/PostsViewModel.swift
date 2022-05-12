//
//  PublicationsViewModel.swift
//  testCeibaWilliam
//
//  Created by Desarrollo MAC on 11/5/22.
//

import Foundation


class PostsViewModel: NSObject {

    var delegate : getDataProtocol?

    private var apiService = APIService()

    private(set) var postsArray: [Post]! {
        didSet {
            self.delegate?.showData()
        }
    }

    override init() {
        super.init()
    }

    func getApiData(idUser : String) {
        self.delegate?.loading()
        apiService.setURlService(urlString: "https://jsonplaceholder.typicode.com/posts?userId=\(idUser)")
        apiService.apiToGetData{ data  in
            do {
                let jsonDecoder = JSONDecoder()
                let listData  = try jsonDecoder.decode([Post].self, from: data)
                self.postsArray = listData
                self.delegate?.hiddeLoading()
            }catch {
                self.delegate?.showError(message: "Serialization Error")
            }
        }
    }
}
