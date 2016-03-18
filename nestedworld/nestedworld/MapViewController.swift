//
//  MapViewController.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 26/02/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate
{
    @IBOutlet weak var mapView: MKMapView!
    
    private let locationManager: CLLocationManager = CLLocationManager()
    
    // MARK: Override functions
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.initLocation()
        self.initMapView()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Private functions
    
    private func initLocation()
    {
        self.locationManager.requestAlwaysAuthorization()
        
        if (CLLocationManager.locationServicesEnabled() == true) {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        print(manager.location?.coordinate)
    }
    
    private func initMapView()
    {
        self.mapView.delegate = self
        self.mapView.showsUserLocation = true
        self.mapView.mapType = MKMapType(rawValue: 0)!
        self.mapView.userTrackingMode = MKUserTrackingMode(rawValue: 2)!
    }

}
