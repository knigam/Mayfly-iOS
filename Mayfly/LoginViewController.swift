//
//  LoginViewController.swift
//  Mayfly
//
//  Created by Kushal Nigam on 7/20/14.
//  Copyright (c) 2014 Kushal Nigam. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, HTTPHelperDelegate {
    
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
    
    //button listener to change between signing in and signing up
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
    
    
    //This is the button listener that either logs the user in or creates an account
    @IBAction func loginBtnOnClick(sender: AnyObject) {
        if validateLabels(){
            var uri :String = "http://staging.mymayfly.com/users/sign_in.json"
            var loginData: [String: AnyObject] = ["email": self.usernameTextField.text, "password": self.passwordTextField.text]
            if createNewAccount {
                uri = "http://staging.mymayfly.com/users.json"
                loginData["password_confirmation"] = self.passwordConfirmationTextField.text
                loginData["name"] = self.nameTextField.text
            }
            let data: [String: AnyObject] = ["user": loginData]
            HTTPHelper.httpPostJSON(uri, data: data, delegate: self)
        }
    }
    
    
    func validateLabels() -> Bool{
        var cont: Bool = true
        var error:String = ""
        let username: String = self.usernameTextField.text
        let password: String = self.passwordTextField.text
        
        if createNewAccount {
            let passwordConfirmation = self.passwordConfirmationTextField.text
            let name = self.nameTextField.text
            
            if name.isEmpty {
                cont = false
                error = "please enter your name"
            }
            
            if passwordConfirmation.isEmpty {
                cont = false
                error = "please confirm your password"
            }
            if (password != passwordConfirmation) {
                cont = false
                error = "confirmation does not match password"
            }
        }
    
        if (countElements(password) < 8) {
            cont = false
            error = "password must be at least 8 characters"
        }
    
        if !username.rangeOfString("@") {
            cont = false
            error = "please enter a valid email address"
        }
    
        if !cont {
            var alert: UIAlertView = UIAlertView()
            alert.title = "Login error"
            alert.message = error
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
        return cont
    }
    
    func didReceiveHTTPResponseResults(results: NSDictionary) {
        if(results["success"] as Bool){
            let tabBarController = self.storyboard.instantiateViewControllerWithIdentifier("tabBarController") as UIViewController
            self.presentViewController(tabBarController, animated: true, completion: nil)
        }
        else {
            let error :String = results["message"] as String
            var alert: UIAlertView = UIAlertView()
            alert.title = "Login error"
            alert.message = error
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
    }
}
