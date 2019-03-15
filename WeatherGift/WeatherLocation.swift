//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Joseph on 3/14/19.
//  Copyright © 2019 Joseph Parks. All rights reserved.
//

import Foundation
import Alamofire

class WeatherLocation {
    var name = ""
    var coordinates = ""
    
    func getWeather() {
        let weatherURL = urlBass + urlAPIKey + coordinates
        
        Alamofire.request(weatherURL).responseJSON { response in
            print(response)
        }
    }
}
