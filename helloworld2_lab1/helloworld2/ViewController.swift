//
//  ViewController.swift
//  helloworld2
//
//  Created by Will Dow on 9/2/14.
//  Copyright (c) 2014 Will Dow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var messageText: UILabel!
    
    @IBAction func buttonPressed(sender: UIButton) {
        messageText.text=sender.currentTitle! + " World!"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

