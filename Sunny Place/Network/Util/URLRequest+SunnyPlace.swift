//
//  URLRequest+SunnyPlace.swift
//  Sunny Place
//
//  Created by Josh Roberts on 02/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

extension URLRequest {
    
    init(url: URL, method: HTTPMethod, headers: [String: String]? = nil) {
        self.init(url: url)
        self.httpMethod = method.rawValue
        
        headers?.forEach { header, value in
            self.setValue(value, forHTTPHeaderField: header)
        }
    }
}
