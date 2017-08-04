//
//  WeatherViewModel.swift
//  Sunny Place
//
//  Created by Josh Roberts on 03/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation
import CoreLocation

class WeatherViewModel: NSObject {
    
    var locationsObserver: (([WeatherLocationViewModel]) -> Void)?
    private(set) public var weatherLocations: [WeatherLocationViewModel] {
        didSet {
            if let observer = locationsObserver {
                observer(weatherLocations)
            }
        }
    }
    fileprivate var locationService: LocationService
    
    init(locationService: LocationService) {
        self.weatherLocations = [WeatherLocationViewModel]()
        self.locationService = locationService
    }
    
    func requestOneTimeLocation() {
        self.locationService.delegate = self
        self.locationService.requestOneTimeLocation()
    }
    
    func fallbackToOfflineStore() {
        print("falling back to weather from storage if possible")
        if let weatherLocations = StorageManager.documentStore.retrieveMostRecentWeatherLocations() {
            self.weatherLocations = weatherLocations.map { weatherLocation in WeatherLocationViewModel(weatherLocation) }
        } else {
            print("no offline store found")
        }
    }
}

extension WeatherViewModel: LocationServiceDelegate {
    
    func didReceiveLocationUpdate(_ location: CLLocation) {
        let latitude = location.coordinate.latitude
        let longiture = location.coordinate.longitude
        
        API.requestWeather(forLatitude: latitude, longitude: longiture, response: { [weak self] (weatherLocations, error) in
            guard error == nil, let weatherLocations = weatherLocations else {
                print(error!)
                print("failed to get weather")
                self?.fallbackToOfflineStore()
                return
            }

            if StorageManager.documentStore.persistMostRecentWeatherLocations(weatherLocations) {
                print("successfully stored weather")
            } else {
                print("failed to store weather - should handle this properly in a production app")
            }
            self?.weatherLocations = weatherLocations.map { weatherLocation in WeatherLocationViewModel(weatherLocation) }
        })
    }
    
    func locationDidFail(withError error: Error) {
        print(error)
        if locationService.lastKnownLocation == nil {
            print("No locations have been found yet - should handle this properly to find out why")
            fallbackToOfflineStore()
        }
    }
}
