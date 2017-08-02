//
//  API+OpenWeatherMaps.swift
//  Sunny Place
//
//  Created by Josh Roberts on 02/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

extension API {
    
    class func requestWeather(forLatitude latitude: Double, longitude: Double) {
        API.request(OpenWeatherMapRouter.findWeather(latitude: latitude, longitude: longitude, maxWeatherStations: 15))
    }
}
