//
//  MainViewController.swift
//  NetworkRequestsHW2.10
//
//  Created by Mary Jane on 26.09.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    let urlAddress = "https://favqs.com/api/qotd"
    
    @IBOutlet var quoteTextLabel: UILabel!
    
    @IBAction func getQuoteButtonPressed() {
        fetchData()
    }
    
    private func fetchData() {
        guard let url = URL(string: urlAddress) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let quote = try JSONDecoder().decode(Quote.self, from: data)
                DispatchQueue.main.async {
                    print(quote)
                    self.updateLabel(quote: quote)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    private func updateLabel(quote: Quote) {
        quoteTextLabel.text = quote.description
    }
}

