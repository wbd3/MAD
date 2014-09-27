//
//  ViewController.swift
//  tipCalculator
//
//  Created by Will Dow on 9/25/14.
//  Copyright (c) 2014 Will Dow. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var checkAmount: UITextField!
    @IBOutlet weak var tipPercent: UITextField!
    @IBOutlet weak var people: UITextField!
    @IBOutlet weak var totalDue: UILabel!
    @IBOutlet weak var tipDue: UILabel!
    @IBOutlet weak var totalPerPerson: UILabel!
    
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateTipTotals() {
        let amount = (checkAmount.text as NSString).floatValue
        let pct = (tipPercent.text as NSString).floatValue/100
        let numberOfPeople=people.text.toInt()
        let tip=amount*pct
        let total=amount+tip
        var personTotal : Float = 0.0
        if numberOfPeople != nil {
            if numberOfPeople! > 0 {
                personTotal = total / Float(numberOfPeople!)
            }
            else {
                let alert=UIAlertController(title: "Warning", message: "Number of people must be greater than 0", preferredStyle: UIAlertControllerStyle.Alert)
                let cancelAction:UIAlertAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(cancelAction)
                let okAction:UIAlertAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { action in
                    self.people.text="1"
                    self.updateTipTotals()
                })
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            }
        }
        var currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle=NSNumberFormatterStyle.CurrencyStyle
        tipDue.text=currencyFormatter.stringFromNumber(tip)
        totalDue.text=currencyFormatter.stringFromNumber(total)
        totalPerPerson.text=currencyFormatter.stringFromNumber(personTotal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkAmount.delegate=self
        tipPercent.delegate=self
        people.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

