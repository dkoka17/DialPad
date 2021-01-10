//
//  KeypadVC.swift
//  DialPad
//
//  Created by dato on 1/4/21.
//

import UIKit

class KeypadVC: UIViewController, MyViewDelegate {
    
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var callButton: UIButton!
    @IBOutlet var textFIeld: UITextField!

    @IBOutlet var numbers: [MyView]!

    var number = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        callButton.layer.cornerRadius = 0.5 * callButton.bounds.size.width
        callButton.clipsToBounds = true
        callButton.backgroundColor = .green
        callButton.layer.masksToBounds = true

        prepateNumbers()
        
        deleteButton.isHidden = true
        
    }


    func prepateNumbers(){
        for numb in numbers {
            numb.delegate = self
        }
        numbers[0].setName(main: "1", second: "")
        numbers[1].setName(main: "2", second: "ABC")
        numbers[2].setName(main: "3", second: "DEF")
        
        numbers[3].setName(main: "4", second: "GHI")
        numbers[4].setName(main: "5", second: "JKL")
        numbers[5].setName(main: "6", second: "MNO")
        
        numbers[6].setName(main: "7", second: "PQRS")
        numbers[7].setName(main: "8", second: "TUV")
        numbers[8].setName(main: "9", second: "WXYZ")
        
        numbers[9].setName(main: "*", second: "")
        numbers[10].setName(main: "0", second: "+")
        numbers[11].setName(main: "#", second: "")
    }

    @IBAction  func delete(sender: UIButton){
        
        if number.count > 0 {
            number.remove(at: number.index(before: number.endIndex))
            let txt = number
            textFIeld.text = txt
        }
        if number.count == 0 {
            deleteButton.isHidden = true
        }
    }

    @IBAction func presentCall() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let callVCNav = mainStoryboard.instantiateViewController(withIdentifier: "CallVC")
        callVCNav.modalPresentationStyle = .overFullScreen
        present(callVCNav, animated: true, completion: nil)
    }
    
    
    
    func buttonTap(_ sender: MyView) {
        number = number + sender.mainNumb
        let txt = number
        textFIeld.text = txt
        if number.count == 1 {
            deleteButton.isHidden = false
        }
    }
    
}


