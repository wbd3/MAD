//
//  FirstViewController.swift
//  currencyExchange_2
//
//  Created by Will Dow on 11/6/14.
//  Copyright (c) 2014 Will Dow. All rights reserved.
//

//in version 6.0

import UIKit
import Social

class FirstViewController: UIViewController, UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }//from tipCalculator
    @IBOutlet weak var edAmount: UITextField!
    @IBOutlet weak var edTotal: UILabel!
    @IBOutlet weak var euroToDollar: UILabel!
    @IBAction func switchEuroToDollar(sender: UISwitch) {
        if sender.on {
            euroToDollar.text="Dollar to Euro"
            var amount = (edAmount.text as NSString).floatValue
            var total = amount*Float(0.8)
            edTotal.text=NSString(format: "%.2f", total)
            
        }
        else {
            euroToDollar.text="Euro to Dollar"
            var amount = (edAmount.text as NSString).floatValue
            var total=amount*Float(1.26)
            edTotal.text=NSString(format: "%.2f", total)
        }
        
    }
    
    
    @IBOutlet weak var peAmount: UITextField!
    @IBOutlet weak var peTotal: UILabel!
    @IBOutlet weak var poundToEuro: UILabel!
    @IBAction func switchPoundToEuro(sender: UISwitch) {
        if sender.on {
            poundToEuro.text="Euro to Pound"
            var amount=(peAmount.text as NSString).floatValue
            var total = amount*Float(0.78)
            peTotal.text=NSString(format: "%.2f", total)
        }
        else {
            poundToEuro.text="Pound to Euro"
            var amount=(peAmount.text as NSString).floatValue
            var total = amount*Float(1.28)
            peTotal.text=NSString(format: "%.2f", total)
        }
    }
    
    
    @IBOutlet weak var pdAmount: UITextField!
    @IBOutlet weak var pdTotal: UILabel!
    @IBOutlet weak var poundToDollar: UILabel!
    @IBAction func switchPoundToDollar(sender: UISwitch) {
        if sender.on {
            poundToDollar.text="Dollar to Pound"
            var amount=(pdAmount.text as NSString).floatValue
            var total = amount*Float(0.63)
            pdTotal.text=NSString(format: "%.2f", total)
        }
        else {
            poundToDollar.text="Pound to Dollar"
            var amount=(pdAmount.text as NSString).floatValue
            var total = amount*Float(1.60)
            pdTotal.text=NSString(format: "%.2f", total)
        }
    }
    
    var user=Currency()
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        
    }
    
    @IBAction func unwindSegue (segue:UIStoryboardSegue){
        
        
    }

    @IBAction func shareToFacebook() {
        var shareToFacebook : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        shareToFacebook.setInitialText("Come Download This Currency Exchange App!")
        self.presentViewController(shareToFacebook, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        edAmount.delegate=self
        peAmount.delegate=self
        pdAmount.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

