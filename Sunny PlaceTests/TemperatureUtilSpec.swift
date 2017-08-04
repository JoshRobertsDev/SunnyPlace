//
//  TemperatureSpec.swift
//  Sunny PlaceTests
//
//  Created by Josh Roberts on 03/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Quick
import Nimble
@testable import Sunny_Place

class TemperatureUtilSpec: QuickSpec {

    override func spec() {

        describe("a temperature converter") {
            var temperatureInKelvin: Double!
            beforeEach {
                temperatureInKelvin = 373.15
            }

            it("should convert kelvin into celsius") {
                let celsius = TemperatureUtil.convert(kelvin: temperatureInKelvin, to: .celsius)
                expect(celsius).to(equal(100))
            }
            
            it("should convert kelvin into fahrenheit") {
                let fahrenheit = TemperatureUtil.convert(kelvin: temperatureInKelvin, to: .fahrenheit)
                expect(fahrenheit).to(equal(212))
            }
        }

    }
}
