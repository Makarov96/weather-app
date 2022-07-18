//
//  LocalDataSources.swift
//  weatherapp (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 11/06/22.
//

import Foundation
import Combine

protocol LocalDataSource{
    
    var weatherStatus: Published<WeatherEntity>.Publisher{get}
    func getWeatherState()
}

class CoreLocalDataStack{
    
}
