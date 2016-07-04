//
//  CashTextFieldDelegate.swift
//  Delegates Challenge
//
//  Created by Sergey Kravtsov on 04.07.16.
//  Copyright © 2016 Sergey Kravtsov. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate{
    
    var numPennies = 0
    
    var strCents: String!
    var strDollars: String!
    var strMoney: String!
    
    func formatMoney () -> String {
        let numCents = numPennies % 100
        let numDollars = numPennies / 100
        
        if numCents < 10 {
            strCents = "0\(numCents)"
        } else {
            strCents = "\(numCents)"
        }
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        strDollars = numberFormatter.stringFromNumber(numDollars)!
        strMoney = "$\(strDollars).\(strCents)"
        return strMoney
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let newDigit: Int!
        
        //If backspace, recalculate
        if (range.length == 1 && string.characters.count == 0) {
            numPennies = numPennies / 10
            textField.text = formatMoney()
        }
        
        //If string is a digit, then multiply numPennies by 10 and add a new digit:
        if Int(string) != nil {
            newDigit = Int(string)
            numPennies = (numPennies * 10 + newDigit)
            textField.text = formatMoney()
        }
        return false
    }
}