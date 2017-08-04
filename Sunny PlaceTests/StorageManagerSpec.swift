//
//  StorageManagerSpec.swift
//  Sunny PlaceTests
//
//  Created by Josh Roberts on 04/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Quick
import Nimble
@testable import Sunny_Place

class StorageManagerSpec: QuickSpec {
    
    override func spec() {
        
        describe("a storage manager") {
            var storageManager: StorageManager!
            var weatherLocation: WeatherLocation!
            
            beforeEach {
                storageManager = StorageManager.documentStore
                storageManager.clearMostRecentWeatherLocations()
                weatherLocation = WeatherLocationHelper.someWeatherLocation
            }
            
            it("should be empty to start") {
                expect(storageManager.retrieveMostRecentWeatherLocations()).to(beNil())
            }
            
            it("should persist and retrieve weather locations to and from a store") {

                expect(StorageManager.documentStore.persistMostRecentWeatherLocations([weatherLocation])).to(beTruthy())
                let mostRecentWeatherLocations = StorageManager.documentStore.retrieveMostRecentWeatherLocations()
                expect(mostRecentWeatherLocations?.count).to(equal(1))
                
//                if let mostRecentWeatherLocations = mostRecentWeatherLocations {
//
//                } else {
//                    fatalError("Result should not be nil")
//                }
            }
        }
        
    }
    
}
