//
//  LocationService.swift
//  Sunny Place
//
//  Created by Josh Roberts on 03/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationServiceDelegate {
    func didReceiveLocationUpdate(_ location: CLLocation)
    func locationDidFail(withError error: Error)
}

class LocationService: NSObject {
    
    private let locationManager = CLLocationManager()
    var delegate: LocationServiceDelegate?
    var lastKnownLocation: CLLocation?
    
    override init() {
        super.init()
        locationManager.pausesLocationUpdatesAutomatically = true
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
    }
    
    func requestOneTimeLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}

extension LocationService: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // most recent location is at the end
        if let mostRecentLocation = locations.last {
            lastKnownLocation = mostRecentLocation
            delegate?.didReceiveLocationUpdate(mostRecentLocation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        delegate?.locationDidFail(withError: error)
    }
}
