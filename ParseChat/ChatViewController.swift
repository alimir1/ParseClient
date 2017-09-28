//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Ali Mir on 9/27/17.
//  Copyright © 2017 com.AliMir. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {
    
    @IBOutlet var messageTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    
    @IBAction func onNewMessage(sender: AnyObject?) {
        
        guard !messageTextField.text!.isEmpty else {
            print("You didn't type anything!")
            return
        }
        
        let message = Message()
        message.text = messageTextField.text
        
        message.saveInBackground {
            success, error in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if success {
                print("message saved!")
            }
            
        }
        
    }
    
}
