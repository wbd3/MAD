//
//  ViewController.swift
//  sportImage_lab2
//
//  Created by Will Dow on 9/9/14.
//  Copyright (c) 2014 Will Dow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var sportImage: UIImageView!
    @IBAction func chooseTeam(sender: UIButton) {
        if sender.tag==1 {
            sportImage.image=UIImage(named: "rockies_logo.png")
            messageLabel.text="I'm a Rockies fan too" + "\(nameField.text)"
        }
        if sender.tag==2 {
            sportImage.image=UIImage(named: "broncos_logo.png")
            messageLabel.text="Get ready for Broncos season" + "\(nameField.text)"
        }
        
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

