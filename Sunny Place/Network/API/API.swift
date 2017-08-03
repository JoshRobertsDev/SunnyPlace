//
//  API.swift
//  Sunny Place
//
//  Created by Josh Roberts on 02/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Foundation

class API {
    
    class func request(_ urlRequestConvertible: URLRequestConvertible, completion: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
        do {
            try SessionManager.default.session.dataTask(with: urlRequestConvertible.asURLRquest()) { (data, response, error) in
                DispatchQueue.main.async {
                    completion(data, response, error)
                }
            }.resume()
        } catch {
            DispatchQueue.main.async {
                completion(nil, nil, error)
            }
        }
    }
}
