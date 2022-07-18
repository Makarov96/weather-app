//
//  WeatherEntity.swift
//  weatherapp (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 11/06/22.
//

import Foundation


public protocol WeatherEntity{
    var lat: Double {get set}
    var lon: Double{get set}
    var timezoneOffset: Int {get set}
    var timeZone:String {get set}
    associatedtype CurrentType:Current
    var current: CurrentType {get set}
    
}

public protocol Current{
    var sunrise: Int {get set}
    var sunset: Int {get set}
    var temp: Double {get set}
    var feelsLike : Double {get set}
    var pressure: Int {get set}
    var humidity: Int {get set}
    var dewPoint: Double {get set}
    var uvi: Int {get set}
    var clouds: Int {get set}
    var visibility: Int {get set}
    var windSpeed: Double {get set}
    var windDeg: Int {get set}
    associatedtype WeatherDetailType: WeatherDetail
    var weather: [WeatherDetailType] {get set}
    
}

public protocol WeatherDetail {
    var id: Int {get set}
    var main: String {get set}
    var description:String {get set}
    var icon:String {get set}
}
