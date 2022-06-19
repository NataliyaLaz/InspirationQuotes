//
//  QuoteTableViewController.swift
//  InspirationQuotes
//
//  Created by Nataliya Lazouskaya on 19.06.22.
//

import UIKit
import StoreKit

class QuoteTableViewController: UITableViewController//, SKProductsRequestDelegate, SKPaymentTransactionObserver {
{
//    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
//        <#code#>
//    }
//
//    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
//        <#code#>
//    }
    
    
    var quotesToShow = [
        "Our greatest glory is not in never falling, but in rising every time we fall. — Confucius",
        "All our dreams can come true, if we have the courage to pursue them. – Walt Disney",
        "It does not matter how slowly you go as long as you do not stop. – Confucius",
        "Everything you’ve ever wanted is on the other side of fear. — George Addair",
        "Success is not final, failure is not fatal: it is the courage to continue that counts. – Winston Churchill",
        "Hardships often prepare ordinary people for an extraordinary destiny. – C.S. Lewis"
    ]
    
    let premiumQuotes = [
        "Believe in yourself. You are braver than you think, more talented than you know, and capable of more than you imagine. ― Roy T. Bennett",
        "I learned that courage was not the absence of fear, but the triumph over it. The brave man is not he who does not feel afraid, but he who conquers that fear. – Nelson Mandela",
        "There is only one thing that makes a dream impossible to achieve: the fear of failure. ― Paulo Coelho",
        "It’s not whether you get knocked down. It’s whether you get up. – Vince Lombardi",
        "Your true success in life begins only when you make the commitment to become excellent at what you do. — Brian Tracy",
        "Believe in yourself, take on your challenges, dig deep within yourself to conquer fears. Never let anyone bring you down. You got to keep going. – Chantal Sutherland"
    ]
    
    private let idQuoteTableViewCell = "idStatisticTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(QuoteTableViewCell.self, forCellReuseIdentifier: idQuoteTableViewCell)
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        guard let navBar = navigationController?.navigationBar else { return }
        title = "InspoQuotes"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Restore",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(restorePressed))
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navBar.tintColor = .white
        navBar.standardAppearance = navBarAppearance
        navBar.scrollEdgeAppearance = navBarAppearance
        
        self.navigationController?.navigationBar.setNeedsLayout()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotesToShow.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idQuoteTableViewCell, for: indexPath) as! QuoteTableViewCell
       
        if indexPath.row < quotesToShow.count {
        cell.quoteLabel.text = quotesToShow[indexPath.row]
            cell.selectionStyle = .none
        } else {
            cell.quoteLabel.text = "Get More Quotes"
            cell.quoteLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .default
        }
        return cell
    }
    
    // MARK: - Table view delegate methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == quotesToShow.count {
         buyPremiumQuotes()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - In-App Purchase Methods
    
    func buyPremiumQuotes() {
        
    }

    @IBAction func restorePressed(_ sender: UIBarButtonItem) {
        print( "Restore pressed")
    }
}

