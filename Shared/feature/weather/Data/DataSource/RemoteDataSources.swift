//
//  RemoteDataSources.swift
//  weatherapp (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 11/06/22.
//

import Foundation
import Combine



class CoreRemoteDataStack{
    private var cancellables = Set<AnyCancellable>()
    @Published var weatherInfo: WeatherModel?
    private func getWeatherInfo(deviceInfo:WeatherRequestModel)async-> WeatherModel {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?appid=\(deviceInfo.appId)&lat=\(deviceInfo.lat)&lon=\(deviceInfo.lon)&exclude=\(deviceInfo.exclude)&units=metric")
            else {
            fatalError("Missing URL")
            }
            print(url)
            let urlRequest = URLRequest(url: url)
            let (data, response) = try! await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200
            else {
                fatalError("Error while fetching data")
            }
        let decodedWeatherStatus = try? JSONDecoder().decode(WeatherModel.self, from: data)
        print("\(decodedWeatherStatus)")
        return decodedWeatherStatus!
    }
    
}

protocol RemoteDataSource{
    var weatherModel: Published<WeatherModel?>.Publisher{get}
    func getWeatherData() async
}

extension CoreRemoteDataStack: RemoteDataSource{
    var weatherModel: Published<WeatherModel?>.Publisher {
        $weatherInfo
    }
    func getWeatherData() async{
         let deviceInfoI:WeatherRequestModel = WeatherRequestModel()
        self.weatherInfo = await self.getWeatherInfo(deviceInfo:deviceInfoI )
    }
}

