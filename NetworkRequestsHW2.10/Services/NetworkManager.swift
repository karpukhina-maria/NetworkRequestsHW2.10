//
//  NetworkManager.swift
//  NetworkRequestsHW2.10
//
//  Created by Mary Jane on 26.09.2021.
//

import Foundation
import Alamofire
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(urlAddress: String, with complition: @escaping (Quote) -> Void) {
        
        AF.request(urlAddress)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    DispatchQueue.main.async {
                        complition(Quote.getQuoteData(from: value))
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}
