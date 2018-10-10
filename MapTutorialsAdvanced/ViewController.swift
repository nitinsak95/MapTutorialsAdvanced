//
//  ViewController.swift
//  MapTutorialsAdvanced
//
//  Created by AFFIXUS IMAC1 on 4/27/18.
//  Copyright © 2018 AFFIXUS IMAC1. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, UIGestureRecognizerDelegate {
   
    var madd: String = ""
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var lbAddress: UILabel!
    @IBOutlet weak var lbMainAdd: UILabel!
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region, animated: true)
        
        print(location.coordinate.latitude)
        print(location.coordinate.longitude)
        let latitudeObtained = location.coordinate.latitude
        let longitudeObtained = location.coordinate.longitude
        
        self.map.showsUserLocation = true
        
        let geoCoder = CLGeocoder()
        let locationAdd = CLLocation(latitude: latitudeObtained, longitude: longitudeObtained)
        geoCoder.reverseGeocodeLocation(locationAdd, completionHandler: { (placemarks, error) -> Void in
            
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            
            var addressString : String = ""
            
            if placeMark.subLocality != nil {
                addressString = addressString + placeMark.subLocality! + ", "
                let mainAdd = placeMark.subLocality!
                self.lbMainAdd.text = mainAdd
            }
            if placeMark.thoroughfare != nil {
                addressString = addressString + placeMark.thoroughfare! + ", "
            }
            if placeMark.locality != nil {
                addressString = addressString + placeMark.locality! + ", "
            }
            if placeMark.country != nil {
                addressString = addressString + placeMark.country! + ", "
            }
            if placeMark.postalCode != nil {
                addressString = addressString + placeMark.postalCode! + " "
            }
            
            print(addressString)
            self.lbAddress.text = addressString
          self.madd = addressString
//            let vc: PopUpViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popo") as! PopUpViewController
//            vc.mainadd = addressString
//            self.present(vc, animated: true, completion: nil)
          
        })
       
    }
   
    @IBAction func btPop(_ sender: UIButton) {
 
        let addd = self.madd
        let vc: PopUpViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popo") as! PopUpViewController
      vc.mainadd = addd
        present(vc, animated: true, completion: nil)
        
    }
    
   
}

