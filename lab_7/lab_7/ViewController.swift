//
//  ViewController.swift
//  lab_7
//
//  Created by Will Dow on 10/21/14.
//  Copyright (c) 2014 Will Dow. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    var words=[String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = NSBundle.mainBundle().pathForResource("qwordswithoutu1", ofType: "plist")
        words = NSArray(contentsOfFile: path!) as Array
    }
    //required methods for UITableViewDataSource
    //Customize the number of rows in section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    //displays table view cells
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //configure the cell
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell
        //set the text of the cell
        cell.textLabel?.text=words[indexPath.row]
        cell.detailTextLabel?.text="Q no U"
        cell.imageView?.image=UIImage(named:"scrabbletile90.png")
        return cell
    }

    //UITableViewDelegate method that is called when a row is selected
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alert = UIAlertController(title: "Row selected", message: "You selected \(words[indexPath.row])", preferredStyle: UIAlertControllerStyle.Alert)
        let okaction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:nil)
        alert.addAction(okaction)
        self.presentViewController(alert, animated: true, completion:nil)
        //deselects the row that had been chosen
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

