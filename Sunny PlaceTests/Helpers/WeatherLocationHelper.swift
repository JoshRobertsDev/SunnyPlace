//
//  WeatherLocationHelper.swift
//  Sunny PlaceTests
//
//  Created by Josh Roberts on 03/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

@testable import Sunny_Place

struct WeatherLocationHelper {
    
    static var someWeatherLocation: WeatherLocation {
        return WeatherLocation(
            name: "Location Name",
            coordinates: Coordinatates(latitude: 1, longitude: -1),
            weather: [WeatherOverview(wid: 804, main: "Clouds", description: "overcast clouds", icon: "04n")],
            keyInfo: WeatherKeyInformation(temperature: 288.15, temperatureMax: 289.15, temperatureMin: 287.15, pressure: 1009, humidity: 77),
            wind: Wind(speed: 20, degrees: 45),
            timestamp: 1501860221
        )
    }
}
