//
//  LocationManager.swift
//  weatherApp
//
//  Created by Aljwhra Alnasser on 08/04/1444 AH.
//

import Foundation
import CoreLocation


//this will allow us to manage everything related to location without running into any error.

class LocationManager: NSObject , ObservableObject, CLLocationManagerDelegate{
    
    // at the top of the class we will need to add manager.
    // so let manager and we will need to createna new instance of CLLocationManager.
    
    let manager = CLLocationManager()
    
    
    // add two published varibles
    
    //CLLocationCoordinate2D it will be optional,because we might not get a location .
    //for example if the user refuses to grant us access to their location.
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    //few functions
    
    override init(){
        //when our class will be initialized, we need to call the super dot init.
        super.init()
        //we need to set the manager delegate to self.
        manager.delegate = self
    }
    
    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    
    //we need to add two functions to make the CLLocationManagerDelegate work
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // assing the location variable
        
        //location will be equals two locations and this is an aray of CLLocation.
        
        location = locations.first?.coordinate
        
        //we will do isLoading false because we got the location,state is not Loading anymore.
        isLoading = false
        
    }
    //we need to add a function to handle errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        //print message
        
        print("Error Getting Location", error)
        isLoading = false
    }
    
}
