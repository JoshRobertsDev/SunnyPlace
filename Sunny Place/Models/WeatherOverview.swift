//
//  WeatherOverview.swift
//  Sunny Place
//
//  Created by Josh Roberts on 02/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

struct WeatherOverview: Codable {
    var wid: Int
    var main: String
    var description: String
    var icon: String
    
    enum SerializationKeys: String, CodingKey {
        case wid = "id"
    }
}
