//
//  Parameters.swift
//  Sunny Place
//
//  Created by Josh Roberts on 03/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

typealias Parameters = Dictionary<String, Any>

struct ParameterEncoding {
    
    static func encodedQuery(fromParameters parameters: Parameters) -> String {
        return parameters.map { (key, value) -> String in
            return "\(key)=\(value)"
        }.joined(separator: "&")
    }
}
