//
//  Constants.swift
//  Sunny Place
//
//  Created by Josh Roberts on 02/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

// MARK: - BaseURLs

enum BaseURLs: String {
    case openWeatherMaps = "http://api.openweathermap.org"
    
    func asURL() throws -> URL {
        guard let url = URL(string: self.rawValue) else {
            throw SPError.invalidURL(fromString: self.rawValue)
        }
        return url
    }
}

// MARK: - API End Points

struct EndPoints {
    
    enum OpenWeatherMaps: String {
        case findWeather = "/data/2.5/find"
    }
}
