//
//  SessionManager.swift
//  Sunny Place
//
//  Created by Josh Roberts on 02/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

class SessionManager {
    
    let session: URLSession
    
    static let `default`: SessionManager = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        return SessionManager(configuration: config)
    }()
    
    static let defaultHTTPHeaders: [String: String] = {
        return [
            "Accept-Encoding": "gzip",
        ]
    }()
    
    private init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
}
