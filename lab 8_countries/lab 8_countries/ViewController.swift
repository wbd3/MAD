//
//  ViewController.swift
//  lab 8_countries
//
//  Created by Will Dow on 10/23/14.
//  Copyright (c) 2014 Will Dow. All rights reserved.
//

import UIKit
//change from viewcontroller to tableviewcontroller
//(editor)embed in navigation controller
//create new file

class ViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate{

    var continentList=Continents()
    override func viewDidLoad() {
        //use a NSBundle object of the directory for our application to retrieve the pathname of continents.plist
        let path=NSBundle.mainBundle().pathForResource("continents", ofType: "plist")
        //loads the words of the plist file into array
        continentList.continentData=NSMutableDictionary(contentsOfFile: path!)
        //gets all keys which are the continents
        continentList.continents = continentList.continentData.allKeys as [String]
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //customize the number of rows in the section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continentList.continentData.count
    }
    
    //displays table view cells
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //configure the cell
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        //set the text of cell
        cell.textLabel?.text=continentList.continents[indexPath.row]
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier=="countrysegue"{
            var countryVC=segue.destinationViewController as DetailViewController
            let indexPath:NSIndexPath=tableView.indexPathForSelectedRow()!
            //sets the data for the destination controller
            countryVC.title=continentList.continents[indexPath.row]
            countryVC.continentCountries=continentList
            countryVC.selectedContinent=indexPath.row
        } else if segue.identifier=="continentsegue"{
            var infoVC=segue.destinationViewController as ContinentInfoTableTableViewController
            let editingCell:UITableViewCell=sender as UITableViewCell
            let indexPath:NSIndexPath=tableView.indexPathForCell(editingCell)!
            infoVC.name=continentList.continents[indexPath.row]
            let countries=continentList.continentData.objectForKey(infoVC.name) as [String]
            infoVC.number=String(countries.count)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

