//
//  WeatherLocationViewModelSpec.swift
//  Sunny PlaceTests
//
//  Created by Josh Roberts on 04/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Quick
import Nimble
@testable import Sunny_Place

class WeatherLocationViewModelSpec: QuickSpec {
    
    override func spec() {
    
        describe("weatherLocationViewModel") {
            var viewModel: WeatherLocationViewModel!
            beforeEach {
                viewModel = WeatherLocationViewModel(WeatherLocationHelper.someWeatherLocation)
            }
            
            it("should init with all view model data properties set correctly") {
                expect(viewModel.locationName).to(equal("Location Name"))
                expect(viewModel.description).to(equal("Overcast Clouds"))
                expect(viewModel.temperature).to(equal("15"))
                expect(viewModel.temperatureMin).to(equal("14°C"))
                expect(viewModel.temperatureMax).to(equal("16°C"))
                expect(viewModel.temperatureSuffix).to(equal("°C"))
                expect(viewModel.pressure).to(equal("1009hPa"))
                expect(viewModel.humidity).to(equal("77%"))
                expect(viewModel.wind).to(equal("45° ↗ 45 mph"))
                expect(viewModel.imageName).to(equal("cloudy_bg"))
            }
            
            it("should return a valid weather image") {
                expect(UIImage(named: viewModel.imageName!) != nil).to(beTruthy())
            }
        }
        
    }
}
