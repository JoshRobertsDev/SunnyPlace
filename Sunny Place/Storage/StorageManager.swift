//
//  Storage.swift
//  Sunny Place
//
//  Created by Josh Roberts on 03/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

typealias PersistCompletionHandler = ((Bool, Error?) -> Void)

class StorageManager {
    
    private let url: URL
    
    static let `documentStore`: StorageManager = {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Could not retrieve documents directory")
        }
        
        return StorageManager(url: url)
    }()
    
    init(url: URL) {
        self.url = url
    }
    
    fileprivate func delete(filePath: String) {
        let fileUrl = url.appendingPathComponent(filePath)
        do {
            if FileManager.default.fileExists(atPath: fileUrl.path) {
                try FileManager.default.removeItem(at: fileUrl)
            }
        } catch {
            fatalError("Can't remove file at url \(fileUrl.absoluteString)")
        }
    }
}

extension StorageManager {
    
    func persistMostRecentWeatherLocations(_ weatherLocations: [WeatherLocation]) -> Bool {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(weatherLocations)
            try data.write(to: url.appendingPathComponent("mostRecentWeather.json"), options: [])
            return true
        } catch {
            return false
        }
    }
    
    func retrieveMostRecentWeatherLocations() -> [WeatherLocation]? {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: url.appendingPathComponent("mostRecentWeather.json"), options: [])
            let weatherLocations = try decoder.decode([WeatherLocation].self, from: data)
            return weatherLocations
        } catch {
            return nil
        }
    }
    
    func clearMostRecentWeatherLocations() {
        delete(filePath: "mostRecentWeather.json")
    }
}
