//
//  Quote.swift
//  NetworkRequestsHW2.10
//
//  Created by Mary Jane on 26.09.2021.
//

struct Quote: Decodable {
    let body: String?
    let author: String?
    var description: String? {
        """
        \(body ?? "")
        \(author ?? "")
        """
    }
    
    init(quoteData: [String: Any]) {
        body = quoteData["body"] as? String
        author = quoteData["author"] as? String
    }
    init(body: String, author: String) {
        self.body = body
        self.author = author
    }

    static func getQuoteData(from value: Any) -> Quote {
        guard let welcomeData = value as? [String: Any] else { return Quote(body: "", author: "") }
        guard let quoteData = welcomeData["quote"] as? [String: Any] else { return Quote(body: "", author: "") }
        return Quote(quoteData: quoteData)
    }
}
