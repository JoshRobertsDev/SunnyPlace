//
//  Router.swift
//  Sunny Place
//
//  Created by Josh Roberts on 02/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

protocol URLRoutable {
    static var baseURL: BaseURLs { get }
    var method: HTTPMethod { get }
    var path: String { get }
}
