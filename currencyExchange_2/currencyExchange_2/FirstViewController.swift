//
//  FirstViewController.swift
//  currencyExchange_2
//
//  Created by Will Dow on 11/6/14.
//  Copyright (c) 2014 Will Dow. All rights reserved.
//

//in version 6.0

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate, currencyUpdateDelegate {
    var etd=Float(1.26)
    var dte=Float(0.8)
    var ptd=Float(1.60)
    var dtp=Float(0.63)
    var etp=Float(0.78)
    var pte=Float(1.28)
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }//from tipCalculator
    
    func numbersDidUpdate(controller:SecondViewController, var doToEu: String, var euToDo: String, var poToDo: String, var doToPo: String, var euToPound: String, var poToEu: String){
      var etd=euToDo
        var dte=doToEu
        var ptd=poToDo
        var dtp=doToPo
        var etp=euToPound
        var pte=poToEu
    }
    
    
    
    @IBOutlet weak var edAmount: UITextField!
    @IBOutlet weak var edTotal: UILabel!
    @IBOutlet weak var euroToDollar: UILabel!
    @IBAction func switchEuroToDollar(sender: UISwitch) {
        if sender.on {
            euroToDollar.text="Dollar to Euro"
            var amount = (edAmount.text as NSString).floatValue
            var total = amount*dte
            edTotal.text=NSString(format: "%.2f", total)
            
        }
        else {
            euroToDollar.text="Euro to Dollar"
            var amount = (edAmount.text as NSString).floatValue
            var total=amount*etd
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
            var total = amount*etp
            peTotal.text=NSString(format: "%.2f", total)
        }
        else {
            poundToEuro.text="Pound to Euro"
            var amount=(peAmount.text as NSString).floatValue
            var total = amount*pte
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
            var total = amount*dtp
            pdTotal.text=NSString(format: "%.2f", total)
        }
        else {
            poundToDollar.text="Pound to Dollar"
            var amount=(pdAmount.text as NSString).floatValue
            var total = amount*ptd
            pdTotal.text=NSString(format: "%.2f", total)
        }
    }
    
    var user=Currency()
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        
    }
    
    @IBAction func unwindSegue (segue:UIStoryboardSegue){
        
        
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

