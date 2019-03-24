//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Joseph on 3/24/19.
//  Copyright © 2019 Joseph Parks. All rights reserved.
//

import Foundation

class WeatherLocation: Codable {
    var name = ""
    var coordinates = ""
    
    init(name: String, coordinates: String) {
        self.name = name
        self.coordinates = coordinates
    }
}
