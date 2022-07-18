//
//  WheaterRespository.swift
//  weatherapp (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 26/06/22.
//

import Foundation


protocol WeatherRepository{
    func getWeatherData() async
    var weatherModel: Published<WeatherModel?>.Publisher{get}
}
