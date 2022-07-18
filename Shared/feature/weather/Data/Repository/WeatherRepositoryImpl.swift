//
//  WeatherRepositoryImpl.swift
//  weatherapp (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 26/06/22.
//

import Foundation
import Combine

class WeatherRepositoryImpl:WeatherRepository{
    @Published var weatherInfo: WeatherModel?
    var weatherModel: Published<WeatherModel?>.Publisher{
        $weatherInfo
    }
    private let remoteDataSource: RemoteDataSource
    private var cancellables = Set<AnyCancellable>()

    
    init(remoteDataSource:RemoteDataSource){
        self.remoteDataSource = remoteDataSource
  
            self.setUp()
       
      
    }
    
    private func setUp(){
        self.remoteDataSource.weatherModel.assign(to: \.weatherInfo, on:self).store(in: &cancellables)
    }
    func getWeatherData() async {
        await remoteDataSource.getWeatherData()
    }
}
