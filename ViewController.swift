//
//  ViewController.swift
//  Location_Aware
//
//  Created by Mit Sengupta on 21/9/17.
//  Copyright © 2017 Mit Sengupta. All rights reserved.
//

import UIKit
import CoreLocation

import MapKit




class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    
    @IBOutlet weak var course: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    
    @IBOutlet weak var altitude: UILabel!
    
    
    @IBOutlet weak var address: UILabel!
    
    
    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        let course = userLocation.course
        let speed = userLocation.speed
        let altitude = userLocation.altitude
        
        
        // Map
        
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        
        
        
        self.map.setRegion(region, animated: true)
        
        print(locations)
        
        
        
        
        

        
        
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            
            if error != nil {
                print(error)
            } else {
                if let placemark = placemarks?[0] {
                    
                    
                    var subToroughfare = ""
                    
                    if placemark.subThoroughfare != nil {
                        subToroughfare = placemark.subThoroughfare!
                    }
                    
                    var thoroughfare = ""
                    
                    if placemark.thoroughfare != nil {
                        thoroughfare = placemark.thoroughfare!
                    }
                    
                    var subLocality = ""
                    
                    if placemark.subLocality != nil {
                        subLocality = placemark.subLocality!
                    
                    
                    
                }
                    
                    var subAdministrativeArea = ""
                    
                    if placemark.subAdministrativeArea != nil {
                        subAdministrativeArea = placemark.subAdministrativeArea!
                        
            }
                    var postalCode = ""
                    
                    if placemark.postalCode != nil {
                        postalCode = placemark.postalCode!
                        
            }
                    
                   var country = ""
                    
                    if placemark.country != nil {
                        country = placemark.country!
                    }
                    
                    
                    self.latitude.text = "Latitude" + "  " + String(latitude)
                    self.longitude.text = "Longitude" + "  " + String(longitude)
                    
                    self.course.text = "Course" + "  " + String(course)
                    self.speed.text = "Speed" + "  " + String(speed)
                    
                    self.altitude.text = "Altitude" + "  " + String(altitude)
                    
                    self.address.text = (subToroughfare + " " + thoroughfare + "\n" + subLocality + "\n" + subAdministrativeArea + "\n" + postalCode + "\n" + country)
                    
                    
                    
                    print(subToroughfare + " " + thoroughfare + "\n" + subLocality + "\n" + subAdministrativeArea + "\n" + postalCode + "\n" + country)
                    
                    
        
                }
        

    }
        }
    
    
    }

}

