//
//  NetworkHelper.swift
//  Fruitify
//
//  Created by Paras Sidhu on 12/07/21.
//

import Foundation
import Alamofire

class HomeViewModel: LoadableObject {
    
    @Published private(set) var state = LoadingState<FruitResponse>.loading
    
    private let JSON_URL = "https://api.jsonstorage.net/v1/json/798dc1af-fdb8-4127-8d43-1d6b5d71f4e0"
    
    init() {
        getHomeJson()
    }
    
    func getHomeJson() {
        let request = AF.request(JSON_URL)
        request.responseDecodable(of: FruitResponse.self) { (response) in
            do {
                let result = try response.result.get()
                self.state = LoadingState.loaded(result)
            } catch {
                self.state = LoadingState.failed(error)
            }
        }
    }
}
