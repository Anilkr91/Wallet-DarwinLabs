//
//  LoginViewController.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/26/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Login action button
    @IBAction func loginButtonTapped(_ sender: Any) {
        
       // validation for white spaces and blank textfields
        if emailTextField.text!.removeAllSpaces().isEmpty {
            Alert.showAlertWithError(title: "Error", message: "Email Field is empty")
          
           // validation for white spaces and blank textfields
        } else if passwordTextField.text!.removeAllSpaces().isEmpty {
            Alert.showAlertWithError(title: "Error", message: "Password Field is empty")
            
        } else {
            
            // parameters for login
            let params = DLLogin(email: emailTextField.text!, password: passwordTextField.text!).toJSON() as! [String: AnyObject]
           
            // Login api called
            LoginPostService.executeRequest(params: params) { (response) in
               
                // setting the user id and token in nsuserdefaults
                Default.setCurrentUser(user: response)
                
                // navigation to successful login
                let application = UIApplication.shared.delegate as! AppDelegate
                application.setHomeUserAsRVC()
            }
        }
    }
}
