//
//  DateFormatter+SunnyPlace.swift
//  Sunny Place
//
//  Created by Josh Roberts on 04/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    fileprivate class func formatter(for format: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        formatter.dateFormat = format
        return formatter
    }
    
    class var weatherDisplayDate: DateFormatter {
        return DateFormatter.formatter(for: "HH:mm d MMM yy")
    }
    
}
