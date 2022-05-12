//
//  APIService.swift
//  testCeibaWilliam
//
//  Created by Desarrollo MAC on 10/5/22.
//

import Foundation

import Foundation

class APIService :  NSObject {

    var sourcesURL =  URL(string: "")

    func setURlService(urlString : String){
        sourcesURL = URL(string: urlString)!
    }

    func apiToGetData(completion : @escaping (Data) -> ()){
        guard let urlService = sourcesURL else{
            print("Error URL")
            return
        }
        URLSession.shared.dataTask(with: urlService) { (data, urlResponse, error) in
            guard let data = data, error == nil else {
                print("error=\(String(describing: error ?? nil))")
                return
            }
            completion(data)

        }.resume()
    }
}

