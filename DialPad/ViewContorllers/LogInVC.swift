//
//  LogInVC.swift
//  DialPad
//
//  Created by dato on 1/4/21.
//

import UIKit

class LogInVC: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var logInText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var passwordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInText.delegate = self
        passwordText.delegate = self
        passwordText.isSecureTextEntry = true
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillChange(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillChange(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillChange(notification:)),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil)
    }
    
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func logIn() {
        
        if (self.logInText.text! == "a"||self.logInText.text! == "test@mail.com") &&
            (self.passwordText.text! == "a" || self.passwordText.text! == "1234") {
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let callVCNav = mainStoryboard.instantiateViewController(withIdentifier: "PhoneNavigation")
            callVCNav.modalPresentationStyle = .overFullScreen
            present(callVCNav, animated: true, completion: nil)
        } else {
            self.passwordText.text = ""
        }
        
       
    }
    
    @objc func keyboardWillChange(notification: Notification) {
       
        guard let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        if notification.name == UIResponder.keyboardWillShowNotification
            || notification.name == UIResponder.keyboardWillChangeFrameNotification{
            view.frame.origin.y = -keyboardFrame.cgRectValue.height
        } else {
            view.frame.origin.y = 0
        }
        
    }
    
}
