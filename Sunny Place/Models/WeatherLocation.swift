//
//  WeatherLocation.swift
//  Sunny Place
//
//  Created by Josh Roberts on 02/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

struct WeatherLocation: Codable {
    var name: String
    var coordinates: Coordinatates
    var weather: [WeatherOverview]
    var keyInfo: WeatherKeyInformation
    var wind: Wind
    var timestamp: TimeInterval
    
    enum CodingKeys: String, CodingKey {
        case name
        case coordinates = "coord"
        case weather
        case keyInfo = "main"
        case wind
        case timestamp = "dt"
    }
}
