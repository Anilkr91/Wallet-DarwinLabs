//
//  RegisterTableViewController.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/26/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class RegisterTableViewController: UITableViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let name = nameTextField.text!
        let phone = phoneTextField.text!
        
       // validation for white spaces and blank textfields
        if email.removeAllSpaces().isEmpty {
            Alert.showAlertWithError(title: "Error", message: "Email Field is empty")
            
            // validation for white spaces and blank textfields
        } else if password.removeAllSpaces().isEmpty {
            Alert.showAlertWithError(title: "Error", message: "Password Field is empty")
           
            // validation for white spaces and blank textfields
        } else if name.removeAllSpaces().isEmpty {
            Alert.showAlertWithError(title: "Error", message: "Name Field is empty")
          
            // validation for white spaces and blank textfields
        } else if phone.removeAllSpaces().isEmpty {
            Alert.showAlertWithError(title: "Error", message: "Phone Field is empty")
            
        } else {
            let params = DLRegister(name: name, password: password, phone: phone, email: email).toJSON() as! [String : AnyObject]
            
            // adding new user using api call
            CreateAccountPostService.executeRequest(params: params ) { (response) in
                Default.setCurrentUser(user: response)
                let application = UIApplication.shared.delegate as! AppDelegate
                application.setHomeUserAsRVC()
            }
        }
    }
}
