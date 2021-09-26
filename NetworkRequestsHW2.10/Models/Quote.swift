//
//  Quote.swift
//  NetworkRequestsHW2.10
//
//  Created by Mary Jane on 26.09.2021.
//

import Foundation

struct Quote: Decodable {
    let body: String
    let author: String
    var description: String {
        "\(body)\n\(author)"
    }
}
