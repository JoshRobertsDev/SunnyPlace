//
//  URLRequest+SunnyPlace.swift
//  Sunny Place
//
//  Created by Josh Roberts on 02/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

extension URLRequest {
    
    init(url: URL, method: HTTPMethod, parameters: Parameters? = nil) {
        self.init(url: url)
        self.httpMethod = method.rawValue
        
        guard let parameters = parameters else { return }
        
        if method == .get  {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
            let existingQuery = components.percentEncodedQuery != nil ? components.percentEncodedQuery! + "&" : ""
            let newQuery = existingQuery + ParameterEncoding.encodedQuery(fromParameters: parameters)
            components.percentEncodedQuery = newQuery
            self.url = components.url
        } else {
            // implementation for other HTTP methods
        }
    }
}
