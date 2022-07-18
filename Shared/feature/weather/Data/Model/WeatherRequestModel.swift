//
//  WeatherRequestModel.swift
//  weatherapp (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 11/06/22.
//

import Foundation


struct WeatherRequestModel{

    var appId:String = "ee04078aced0390f8b5c1858ace2294f"
    var lat:Double = container.resolve(LocationDevice.self)?.cordinate?.latitude ?? 0.000
    var lon:Double = container.resolve(LocationDevice.self)?.cordinate?.longitude ?? 0.000
    var exclude:String = "minutely,hourly,daily"

}
