//
//  API+OpenWeatherMaps.swift
//  Sunny Place
//
//  Created by Josh Roberts on 02/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

extension API {
    
    class func requestWeather(forLatitude latitude: Double, longitude: Double, response: @escaping (([WeatherLocation]?, Error?) -> Void)) {
        API.request(OpenWeatherMapRouter.findWeather(latitude: latitude, longitude: longitude, maxWeatherStations: 15), completion: { data, urlResponse, error in
            guard error == nil else { response(nil, error!); return }
            guard let data = data else { response(nil, SPError.noData); return }
            
            let decoder = JSONDecoder()
            
            do {
                struct Response: Codable { var list: [WeatherLocation] }
                let weatherLocations = try decoder.decode(Response.self, from: data)
                response(weatherLocations.list, nil)
            } catch {
                response(nil, error)
            }
        })
    }
}
