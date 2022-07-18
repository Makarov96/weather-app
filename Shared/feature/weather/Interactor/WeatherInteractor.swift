//
//  WeatherInteractor.swift
//  weatherapp (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 26/06/22.
//

import Foundation
import Combine


class WeatherInteractor{
    private let weatherRepository:WeatherRepository
    private var cancellables = Set<AnyCancellable>()
    @Published var weatherData: WeatherModel?
    init(weatherRepository:WeatherRepository) {
        
        self.weatherRepository = weatherRepository
        Task(){
            await self.setUp()
        }
        
        
    }
    
    
    func getData() async  {
        
        await weatherRepository.getWeatherData()
    }
    
    private func setUp() async{
        _ = await  getData()
        weatherRepository.weatherModel.map({
            weather -> WeatherModel?
            in
            return weather.map {
                return WeatherModel(lat: $0.lat, lon: $0.lon, timezone: $0.timezone, timezoneOffset: $0.timezoneOffset, current: $0.current)
            }
        }).assign(to: \.weatherData, on: self).store(in: &cancellables)
        //_ = weatherRepository.weatherModel.assign(to: \.weatherData, on: self).store(in: &cancellables)
    }
}
