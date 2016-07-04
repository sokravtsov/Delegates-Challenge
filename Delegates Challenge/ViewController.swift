//
//  ViewController.swift
//  Delegates Challenge
//
//  Created by Sergey Kravtsov on 04.07.16.
//  Copyright © 2016 Sergey Kravtsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var zipCode: UITextField!
    @IBOutlet weak var cash: UITextField!
    @IBOutlet weak var lockable: UITextField!
    @IBOutlet weak var lockableTextFieldSwitch: UISwitch!
    
    
    var zipDelegate = ZipCodeTextFieldDelegate()
    var cashDelegate = CashTextFieldDelegate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lockableTextFieldSwitch.enabled = false
        self.zipCode.delegate = self.zipDelegate
        self.cash.delegate = self.cashDelegate
        self.lockable.delegate = self
    }
    
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if zipCode.text! != "" && cash.text! != "" {
            lockableTextFieldSwitch.setOn(true, animated:true)
            return true
        } else {
            lockableTextFieldSwitch.setOn(false, animated:true)
            return false
        }
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var newText: NSString
        
        if lockableTextFieldSwitch.on {
            newText = textField.text!
            newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        }
        return true
    }
}

