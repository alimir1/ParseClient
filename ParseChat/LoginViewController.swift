//
//  ViewController.swift
//  ParseChat
//
//  Created by Ali Mir on 9/27/17.
//  Copyright © 2017 com.AliMir. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func registerUser() {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                self.handleLogin()
            }
        }   
    }
    
    func handleLogin() {
        let composeNavVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "composeMessageNav")
        self.present(composeNavVC, animated: true, completion: nil)
    }
    
    @IBAction func loginUser() {
        
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                self.handleLogin()
            }
        }   
    }
    
}

