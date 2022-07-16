//
//  ContentModel.swift
//  CitySights
//
//  Created by Salima O. on 16/07/2022.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
   
    var locationManager = CLLocationManager()
    
    override init() {
        
        // Init method of NSObject
        super.init()
        
        // Set content model as the delegate of the location manager
        locationManager.delegate = self
        
        // Request Permission from user
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    // MARK - Location Manager Delegate Methods
    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        
        if  locationManager.authorizationStatus == .authorizedAlways ||
                locationManager.authorizationStatus == .authorizedWhenInUse {
            
             // We have permission
            //Start geolocating the user, after we get permission
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
            // We do not have permission
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Gives us the location of the user
        print(locations.first ?? "no location")
        
        // Stop requesting the location after we get it once
        locationManager.stopUpdatingLocation()
        
        // TODO: If we have the coordinates of the user, send it to Yelp API
    }

}
