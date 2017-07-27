//
//  ShowWalletViewController.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/27/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class ShowWalletViewController: UIViewController {

    @IBOutlet weak var walletInfoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        showWallet()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showWallet() {
        ShowWalletGetService.executeRequest { (response) in
            print(response)
            self.walletInfoLabel.text = "Balance: \(response.balance) \n User: \(response.user) \n created date: \(response.createdAt) \n xpub: \(response.xpub)"
        }
    }
}
