//
//  OpenWeatherMapRouter.swift
//  Sunny Place
//
//  Created by Josh Roberts on 02/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

enum OpenWeatherMapRouter: URLRoutable {
    
    static var baseURL = BaseURLs.openWeatherMaps
    
    case findWeather(latitude: Double, longitude: Double, maxWeatherStations: Int)
    
    var method: HTTPMethod {
        switch self {
        case .findWeather: return .get
        }
    }
    
    var path: String {
        return EndPoints.OpenWeatherMaps.findWeather.rawValue
    }
}

extension OpenWeatherMapRouter: URLRequestConvertible {
    
    func asURLRquest() throws -> URLRequest {
        let url = try OpenWeatherMapRouter.baseURL.asURL()
        
        let headers: [String: String]? = {
            switch self {
            case .findWeather(let latitude, let longitude, let maxWeatherStations):
                return ["lat": String(latitude), "lon": String(longitude), "cnt": String(maxWeatherStations)]
            }
        }()
        
        let urlRequest = URLRequest(url: url, method: method, headers: headers)
        return urlRequest
    }
}
