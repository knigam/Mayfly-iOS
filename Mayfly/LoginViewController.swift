//
//  LoginViewController.swift
//  Mayfly
//
//  Created by Kushal Nigam on 7/20/14.
//  Copyright (c) 2014 Kushal Nigam. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //Controller Variables
    var createNewAccount :Bool = false
    
    //UI Variables
    @IBOutlet var usernameTextField: UITextField
    @IBOutlet var passwordTextField: UITextField
    @IBOutlet var passwordConfirmationTextField: UITextField
    @IBOutlet var nameTextField: UITextField
    @IBOutlet var newAccountToggleBtnText: UILabel
    @IBOutlet var loginBtn: UIButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createNewAccount = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func viewTapped(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    @IBAction func toggleNewAccountBtn(sender: AnyObject) {
        createNewAccount = !createNewAccount
        
        //If we just toggled to create account
        //make confirmation and name fields not hidden
        if createNewAccount {
            passwordConfirmationTextField.hidden = false
            nameTextField.hidden = false
            
            //Now change the text on the buttons
            loginBtn.titleLabel.text = "Sign up"
            newAccountToggleBtnText.text = "Have an account?"
        }
        
        //Otherwise hide fields and show only what
        //is needed for logging in
        else {
            passwordConfirmationTextField.hidden = true
            nameTextField.hidden = true
            
            loginBtn.titleLabel.text = "Sign in"
            newAccountToggleBtnText.text = "Need an account?"
        }
    }
    
    @IBAction func loginBtnOnClick(sender: AnyObject) {
        let tabBarController = self.storyboard.instantiateViewControllerWithIdentifier("tabBarController") as UIViewController
        self.presentViewController(tabBarController, animated: true, completion: nil)
    }
}
