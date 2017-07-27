//
//  HomeTableTableViewController.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/26/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class HomeTableTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("logged in")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   
    @IBAction func createWalletButtonTapped(_ sender: Any) {
        // Create wallet api
        CreateWalletPostService.executeRequest { (response) in
            print(response)
            
            Default.setCurrentUserWallet(user: response)
            let details = "ID: \(response._id) \n User: \(response.user) \n Xpub: \(response.xpub)"
            // alert views popups
            Alert.showAlertWithError(title: "Wallet Created", message: details)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FundTransferSegue" {
            // data transfering from home to sendMoney
            
            let dvc = segue.destination as! SendMoneyViewController
            let user = Default.getCurrentUserWallet().user
            let xpub = Default.getCurrentUserWallet().xpub
            dvc.info = "logged in \n user: \(user) \n xpub: \(xpub)"
        } 
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        let user = DLUser(_id: "", token: "")
        Default.setCurrentUser(user: user)
        let application = UIApplication.shared.delegate as! AppDelegate
        application.setHomeGuestAsRVC()
    }
}
