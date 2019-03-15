//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Joseph on 3/14/19.
//  Copyright © 2019 Joseph Parks. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemp = "--"
    
    func getWeather(completed: @escaping() -> ()) {
        let weatherURL = urlBass + urlAPIKey + coordinates
        Alamofire.request(weatherURL).responseJSON { response in
            switch.response.result {
            case.success(let value):
                let json = JSON(value)
                if let temperature = json["currently"]["temperature"].double {
                    print("***** temperature inside getWeather = \(temperature)")
                    let roundedTemp = String(format: "%3.f", temperature )
                    self.currentTemp = roundedTemp + "°"
                } else {
                    print("Could not return a temperature")
                }
                print("***** json: \(json)")
            case.failure(let error):
                print(error)
            }
            completed()
        }
    }
}
