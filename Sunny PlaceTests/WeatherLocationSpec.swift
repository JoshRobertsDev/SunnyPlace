//
//  WeatherLocationSpec.swift
//  Sunny PlaceTests
//
//  Created by Josh Roberts on 04/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Quick
import Nimble
@testable import Sunny_Place

class WeatherLocationSpec: QuickSpec {
    
    override func spec() {
    
        describe("weatherLocationViewModel") {
            var weatherLocation: WeatherLocation!
            beforeEach {
                weatherLocation = WeatherLocationHelper.someWeatherLocation
            }
            
            it("should init with weather properities set correctly") {
                expect(weatherLocation.name).to(equal("Location Name"))
                expect(weatherLocation.coordinates.latitude).to(equal(1))
                expect(weatherLocation.coordinates.longitude).to(equal(-1))
                expect(weatherLocation.weather.count).to(equal(1))
                let weather = weatherLocation.weather.first!
                expect(weather.wid).to(equal(804))
                expect(weather.main).to(equal("Clouds"))
                expect(weather.description).to(equal("overcast clouds"))
                expect(weather.icon).to(equal("04n"))
                expect(weatherLocation.keyInfo.temperature).to(equal(288.15))
                expect(weatherLocation.keyInfo.temperatureMax).to(equal(289.15))
                expect(weatherLocation.keyInfo.temperatureMin).to(equal(287.15))
                expect(weatherLocation.keyInfo.pressure).to(equal(1009))
                expect(weatherLocation.keyInfo.humidity).to(equal(77))
                expect(weatherLocation.wind.speed).to(equal(20))
                expect(weatherLocation.wind.degrees).to(equal(45))
            }
        }

    }
}
