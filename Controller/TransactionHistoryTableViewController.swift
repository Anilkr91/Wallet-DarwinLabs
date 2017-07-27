//
//  TransactionHistoryTableViewController.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/27/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class TransactionHistoryTableViewController: UITableViewController {

     var array : [DLTransactionHistory] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionHistory()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = "Value: \(array[indexPath.row].value) \n TimeStamp: \(array[indexPath.row].timeStamp)"
        cell.detailTextLabel?.text = "Sender:\(array[indexPath.row].from) \n TransactionIndex: \(array[indexPath.row].transactionIndex)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func transactionHistory() {
        TransactionHistoryGetService.executeRequest { (response) in
            
            self.array = response
            
            if response.count == 0 {
            Alert.showAlertWithError(title: "", message: "Not have enough transactions to show")
            
            } else {
            self.tableView.reloadData()
            }
        }
    }

}
