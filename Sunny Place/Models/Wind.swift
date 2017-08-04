//
//  Wind.swift
//  Sunny Place
//
//  Created by Josh Roberts on 04/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

struct Wind: Codable {
    var speed: Double
    var degrees: Int
    
    enum CodingKeys: String, CodingKey {
        case speed
        case degrees = "deg"
    }
}
