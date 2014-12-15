//
//  SecondViewController.swift
//  currencyExchange_2
//
//  Created by Will Dow on 11/11/14.
//  Copyright (c) 2014 Will Dow. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var euToDo: UITextField!
    @IBOutlet weak var doToEu: UITextField!
    @IBOutlet weak var poToEu: UITextField!
    @IBOutlet weak var euToPound: UITextField!
    @IBOutlet weak var poToDo: UITextField!
    @IBOutlet weak var doToPo: UITextField!
    
    override func viewDidLoad() {
        euToDo.delegate=self
        doToEu.delegate=self
        poToEu.delegate=self
        euToPound.delegate=self
        poToDo.delegate=self
        doToPo.delegate=self
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneCurr"{
            var Scene1ViewController:FirstViewController = segue.destinationViewController as FirstViewController
          //  Scene1ViewController.user.eToD=euroToDollar.text
            Scene1ViewController.user.dToE=doToEu.text
            Scene1ViewController.user.pToE=poToEu.text
    
            Scene1ViewController.user.eToP=euToPound.text
            Scene1ViewController.user.eToP=poToDo.text
            Scene1ViewController.user.dToP=doToPo.text
            //can not figure out how to connect the "update currency" field with the currency exchange text field
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
