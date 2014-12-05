//
//  ViewController.swift
//  location_lab 11
//
//  Created by Will Dow on 11/13/14.
//  Copyright (c) 2014 Will Dow. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
      mapView.mapType=MKMapType.Hybrid // hybrid with map and satellite
        var status:CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        if status==CLAuthorizationStatus.NotDetermined{
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyBest // specify desired accuracy
        locationManager.distanceFilter=kCLDistanceFilterNone // specify the distance a device must move laterally (in meters) to generate an update. We specify to be notified of all movements
        mapView.showsUserLocation=true
        
        
        
        // let location = CLLocationCoordinate2D (latitude: 40.74836, longitude: -73.984607)
      //  let annotation = MKPointAnnotation() //create an annotation
       // annotation.setCoordinate(location) //sets coordinates of the annotation
        //annotation.title="Empire State Building" //sets the title of the annotation
        //annotation.subtitle="New York" //sets subtitle of annotation
        //mapView.addAnnotation(annotation) // adds annotation to map view
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

 
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        let span = MKCoordinateSpanMake(0.05, 0.05) //defines area spanned by a map region
        let region = MKCoordinateRegionMake(manager.location.coordinate, span)// regon of the map to be displayed
        
        mapView.setRegion(region, animated: true) //animates changing the currently visible region
    }

    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status==CLAuthorizationStatus.AuthorizedWhenInUse{
            locationManager.startUpdatingLocation()
        }
    }
    
    //called when a location cannot be determined
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        var errorType=String()
        if let clError= CLError.toRaw(){
            if CLError == .Denied {
                errorType="access denied"
                
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

