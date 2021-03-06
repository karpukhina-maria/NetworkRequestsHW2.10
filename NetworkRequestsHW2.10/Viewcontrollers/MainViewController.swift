//
//  MainViewController.swift
//  NetworkRequestsHW2.10
//
//  Created by Mary Jane on 26.09.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private let urlAddress = "https://favqs.com/api/qotd"
    
    @IBOutlet var quoteTextLabel: UILabel!
    
    @IBAction func getQuoteButtonPressed() {
        NetworkManager.shared.fetchData(urlAddress: urlAddress) { quote in
            self.quoteTextLabel.text = quote.description
        }
    }
}

