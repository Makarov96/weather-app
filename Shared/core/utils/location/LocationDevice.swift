//
//  LocationDevice.swift
//  weatherapp (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 11/06/22.
//

import Foundation
import CoreLocation
import SwiftUI

protocol LocationDevice{
    
    var cordinate:CLLocationCoordinate2D? {get set}
    func authorizedWhenInUse()
    
}


class LocationDeviceInvoke:NSObject, LocationDevice, ObservableObject,CLLocationManagerDelegate {
    
    
    private let locManager = CLLocationManager()
    var cordinate: CLLocationCoordinate2D?
    @Published var isPermitGetLocation:Bool = true
    

    
    override  init(){
        super.init()
        self.locManager.delegate = self
        self.locManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locManager.startUpdatingLocation()
        self.cordinate = actualLocation()
        permissionHandler()
       
  
    }
    
    func permissionHandler(){

        if
            locManager.authorizationStatus == .authorizedWhenInUse ||
                locManager.authorizationStatus ==  .authorizedAlways
        {
            isPermitGetLocation = false
        }else{
            isPermitGetLocation = true
        }
     
    }
    
    func actualLocation()->CLLocationCoordinate2D?{
        if(isPermitGetLocation){
            return  locManager.location?.coordinate
        }else{
            permissionHandler()
            return nil
        }
    }
    
    
    func authorizedWhenInUse(){
        locManager.requestWhenInUseAuthorization()
        permissionHandler()
    }
    
    func authorizedAlway(){
        locManager.requestAlwaysAuthorization()
        permissionHandler()
    }
    
 
}

