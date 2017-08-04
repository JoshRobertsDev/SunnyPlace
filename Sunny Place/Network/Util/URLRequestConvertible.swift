//
//  URLRequestConvertible.swift
//  Sunny Place
//
//  Created by Josh Roberts on 02/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

protocol URLRequestConvertible {
    func asURLRquest() throws -> URLRequest
}
