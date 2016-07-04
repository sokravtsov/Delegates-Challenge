//
//  ZipCodeTextFieldDelegate.swift
//  Delegates Challenge
//
//  Created by Sergey Kravtsov on 04.07.16.
//  Copyright © 2016 Sergey Kravtsov. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {

    func textFieldDidBeginEditing(textField: UITextField) {
        textField.clearButtonMode = UITextFieldViewMode.WhileEditing;
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        switch (string) {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" :
            let text = textField.text! as NSString
            return text.length < 5
        default :
            return false
        }
    } 
}

