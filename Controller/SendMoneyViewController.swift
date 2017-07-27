//
//  SendMoneyViewController.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/26/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class SendMoneyViewController: UIViewController {

    @IBOutlet weak var sendingToTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var infoLabelTextField: UILabel!
    var info: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabelTextField.text = info
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func transferButtonTapped(_ sender: UIButton) {
        
        let to = sendingToTextField.text!
        let amount = amountTextField.text!
        
        // validation for white spaces and blank textfields
        if to.removeAllSpaces().isEmpty {
          Alert.showAlertWithError(title: "Error", message: "Etherum address field is empty")
        
        // validation for white spaces and blank textfields
        } else if amount.removeAllSpaces().isEmpty {
            Alert.showAlertWithError(title: "Error", message: "Amount field address is empty")
        
            // validation for white spaces and blank textfields
        } else if to.characters.count < 42 {
            Alert.showAlertWithError(title: "Error", message: "Etherum address is not valid")
        
        }  else {
            let params = DLFundTransfer(to: sendingToTextField.text!, amount: Double(amount)!).toJSON() as! [String: AnyObject]
            
            // sending money to friends or someone others wallet api
            FundTransferPostService.executeRequest(params: params) { (response) in
                
                // going back to previous view controller from navigation stack
                self.navigationController!.popViewController(animated: true)
            }
        }

       
    }
    }


//@IBAction func userTappedBackground(sender: AnyObject) {
//    view.endEditing(true)
//}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


