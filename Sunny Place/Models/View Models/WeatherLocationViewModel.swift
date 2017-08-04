//
//  WeatherLocationViewModel.swift
//  Sunny Place
//
//  Created by Josh Roberts on 04/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

struct WeatherLocationViewModel {
    
    fileprivate let weatherLocation: WeatherLocation
    var locationName: String
    var description: String
    var temperature: String
    var temperatureMin: String
    var temperatureMax: String
    var temperatureSuffix: String
    var pressure: String
    var humidity: String
    var wind: String
    var dateTimeWeatherRetrieved: String
    var imageName: String?
    
    init(_ weatherLocation: WeatherLocation) {
        self.weatherLocation = weatherLocation
        self.locationName = weatherLocation.name
        self.description = weatherLocation.weather.first?.description.capitalized ?? ""
        self.temperatureSuffix = TemperatureScale.celsius.rawValue
        self.temperature = String(TemperatureUtil.convert(kelvin: weatherLocation.keyInfo.temperature, to: .celsius))
        self.temperatureMin = String(TemperatureUtil.convert(kelvin: weatherLocation.keyInfo.temperatureMin, to: .celsius)) + temperatureSuffix
        self.temperatureMax = String(TemperatureUtil.convert(kelvin: weatherLocation.keyInfo.temperatureMax, to: .celsius)) + temperatureSuffix
        self.pressure = String(weatherLocation.keyInfo.pressure) + "hPa"
        self.humidity = String(weatherLocation.keyInfo.humidity) + "%"
        let windDegrees = weatherLocation.wind.degrees
        let windSpeedUnit = WindUtil.SpeedUnit.milesPerHour
        let windSpeed = WindUtil.convert(metresPerSecond: weatherLocation.wind.speed, to: windSpeedUnit)
        self.wind = "\(weatherLocation.wind.degrees)° \(WindUtil.arrow(forDegreeDirection: windDegrees)) \(windSpeed) \(windSpeedUnit.rawValue)"
        let dateString = DateFormatter.weatherDisplayDate.string(from: Date(timeIntervalSince1970: weatherLocation.timestamp))
        self.dateTimeWeatherRetrieved = "* " + dateString
        
        if let weather = weatherLocation.weather.first {
            self.imageName = {
                switch weather.wid {
                case 200...232: return "thunderstorm_bg"
                case 300...321: return "drizzle_bg"
                case 500...531: return "rainy_bg"
                case 600...622: return "snowy_bg"
                case 800: return "sunny_bg"
                case 801...804: return "cloudy_bg"
                default: return nil
                }
            }()
        }
    }
}
