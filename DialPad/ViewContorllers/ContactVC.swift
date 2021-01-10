//
//  ContactVC.swift
//  DialPad
//
//  Created by dato on 1/9/21.
//

import UIKit


class ContactVC: UIViewController {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var curContact = ""
    var curNumber = ""
   
    @IBAction func addContact(_ sender: Any) {
        let alert = UIAlertController(
            title: "Add Contact",
            message: "Add Contact",
            preferredStyle: .alert)
        
        alert.addTextField { [unowned self](textField) in
            textField.placeholder = "Contact Name"
            textField.addTarget(self, action: #selector(self.nameChanged(textField:)), for: .editingChanged)
        }
        
        alert.addTextField { [unowned self](textField) in
            textField.placeholder = "Contact Number"
            textField.keyboardType = .numberPad
            textField.addTarget(self, action: #selector(self.numberChanged(textField:)), for: .editingChanged)
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { [unowned self] (_) in
            
            print(self.curNumber)
            print(self.curContact)
            
        }))
        
        present(alert, animated: true, completion: nil)
    }

    @objc func nameChanged(textField: UITextField){
        curContact = textField.text ?? ""
    }
    
    @objc func numberChanged(textField: UITextField){
        curNumber = textField.text ?? ""
    }
}


