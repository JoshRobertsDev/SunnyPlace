//
//  WindUtil.swift
//  Sunny Place
//
//  Created by Josh Roberts on 03/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

struct WindUtil {
    
    enum WindDirection: Int {
        case n = 0
        case ne = 45
        case e = 90
        case se = 135
        case s = 180
        case sw = 225
        case w = 270
        case nw = 315
    }
    
    static func arrowForWindDirection(_ windDirection: WindDirection) -> String {
        switch windDirection {
        case .n: return "↑"
        case .ne: return "↗"
        case .e: return "→"
        case .se: return "↘"
        case .s: return "↓"
        case .sw: return "↙"
        case .w: return "←"
        case .nw: return "↖"
        }
    }
    
    static func closestWindDirection(forDegreeDirection degrees: Int) -> WindDirection {
        var smallestDifference = 45
        var closestWindDirection: WindDirection?
        let windDirections: [WindDirection] = [.n, .ne, .e, .se, .s, .sw, .w, .nw]
        windDirections.forEach {
            let difference = abs($0.rawValue - degrees)
            if difference < smallestDifference {
                smallestDifference = difference
                closestWindDirection = $0
            }
        }
        if abs(360 - degrees) < smallestDifference {
            closestWindDirection = .n
        }
        
        return closestWindDirection!
    }
    
    static func arrow(forDegreeDirection degrees: Int) -> String {
        return arrowForWindDirection(closestWindDirection(forDegreeDirection: degrees))
    }
    
    enum SpeedUnit: String {
        case milesPerHour = "mph"
        case kmPerHour = "km/h"
    }
    
    static func convert(metresPerSecond: Double, to unit: SpeedUnit) -> Int {
        switch unit {
        case .kmPerHour: return Int(round(metresPerSecond * 3.6))
        case .milesPerHour: return Int(round(metresPerSecond * 2.2369362920544))
        }
    }
}
