//
//  WeatherPresenter.swift
//  weatherapp (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 26/06/22.
//

import Foundation
import Combine

class WeatherPresenter: ObservableObject{
    
    private let weatherInterator: WeatherInteractor
    private var cancellables = Set<AnyCancellable>()
    @Published var weatherModel: WeatherModel?
  
    
    init(weatherInteractor:WeatherInteractor){
        self.weatherInterator = weatherInteractor
        self.weatherInterator.$weatherData.assign(to: \.weatherModel, on: self).store(in: &cancellables)
    }
    
    
    func updateData()async->Void{
       await weatherInterator.getData()
    }
    
}
