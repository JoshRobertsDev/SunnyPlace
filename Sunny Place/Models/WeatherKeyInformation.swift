//
//  WeatherKeyInformation.swift
//  Sunny Place
//
//  Created by Josh Roberts on 02/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

struct WeatherKeyInformation: Codable {
    var temperature: Double
    var temperatureMax: Double
    var temperatureMin: Double
    var pressure: Int
    var humidity: Int
    
    enum SerializationKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMax = "temp_max"
        case temperatureMin = "temp_min"
        case pressure
        case humidity
    }
}
