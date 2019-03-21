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
    var currentIcon = ""
    var currentTime = 0.0
    var timeZone = ""
    
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
                if let summary = json["daily"]["summary"].string {
                    self.currentSummay = summary
                } else {
                    print("Could not return a summary")
                }
                if let icon = json["currently"]["icon"].string {
                    self.currentIcon = icon
                } else {
                    print("Could not return an icon")
                }
                if let timeZone = json["timezone"]["icon"].string {
                    print("TIMEZONE for \(self.name) is \(timeZone)")
                    self.timeZone = timeZone
                } else {
                    print("Could not return a timeZone")
                }
                if let time = json["currently"]["time"].string {
                    print("TIME for \(self.name) is \(time)")
                    self.currentTime = time
                } else {
                    print("Could not return a time")
                }
            case.failure(let error):
                print(error)
            }
            completed()
        }
    }
}
