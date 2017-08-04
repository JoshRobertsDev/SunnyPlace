//
//  Error.swift
//  Sunny Place
//
//  Created by Josh Roberts on 02/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

enum SPError: Error {
    
    case invalidURL(fromString: String)
    case noData
}
