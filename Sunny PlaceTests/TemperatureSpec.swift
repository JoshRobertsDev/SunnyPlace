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

class TemperatureSpec: QuickSpec {

    override func spec() {

        describe("a temperature converter") {
            var temperatureInKelvin: Double!
            beforeEach {
                temperatureInKelvin = 373.15
            }

            it("should convert kelvin into celsius") {
                let celsius = Temperature.convert(kelvin: temperatureInKelvin, to: .celsius)
                expect(celsius).to(equal(100))
            }
            
            it("should convert kelvin into fahrenheit") {
                let fahrenheit = Temperature.convert(kelvin: temperatureInKelvin, to: .fahrenheit)
                expect(fahrenheit).to(equal(212))
            }
            
            it("should display a celsius suffix for celsius temperatures") {
                expect(Temperature.suffix(for: .celsius)).to(equal("°C"))
            }
            
            it("should display a fahrenheit suffix for fahrenheit temperatures") {
                expect(Temperature.suffix(for: .fahrenheit)).to(equal("°F"))
            }
        }

    }
}
