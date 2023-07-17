//
//  ViewController.swift
//  Alert
//
//  Created by Terry Jason on 2023/7/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var password2Text: UITextField!
    
    var message = ""
    var register = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signupClicked(_ sender: Any) {
        check()
        alertOrNot()
    }
    
    func check() {
        checkUsername()
    }
    
    func checkUsername() {
        let text = usernameText.text!
        
        let charactersRange = text.rangeOfCharacter(from: .letters)
        
        if text == "" {
            message = "Username not found"
        } else if charactersRange == nil {
            message = "Username need Character"
        } else {
            checkPassword()
        }
    }
    
    func checkPassword() {
        if passwordText.text == "" {
            message = "Password not found"
        } else if password2Text.text == "" {
            message = "Write password again to check"
        } else if passwordText.text != password2Text.text {
            message = "Password not match"
        } else {
            register = true
            cleanField()
        }
    }
    
    func cleanField() {
        usernameText.text = ""
        passwordText.text = ""
        password2Text.text = ""
    }
    
    func alertOrNot() {
        if register == false {
            setAlert()
        } else {
            print("成功註冊")
            register = false
            usernameText.becomeFirstResponder()
        }
    }
    
    func setAlert() {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { action in
            print("OK")
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { action in
            print("Cancel")
        }
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        
        self.present(alert, animated: true)
    }
    
}

