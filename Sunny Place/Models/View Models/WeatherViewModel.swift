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
}

extension WeatherViewModel: LocationServiceDelegate {
    
    func didReceiveLocationUpdate(_ location: CLLocation) {
        let latitude = location.coordinate.latitude
        let longiture = location.coordinate.longitude
        
        API.requestWeather(forLatitude: latitude, longitude: longiture, response: { [weak self] (weatherLocations, error) in
            guard error == nil else { return }
            guard let weatherLocations = weatherLocations else { return }
            self?.weatherLocations = weatherLocations.map { weatherLocation in WeatherLocationViewModel(weatherLocation) }
        })
    }
    
    func locationDidFail(withError error: Error) {
        print(error)
    }
}
