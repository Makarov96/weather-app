//
//  UpWeatherContent.swift
//  weatherapp (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 2/06/22.
//

import SwiftUI

struct UpWeatherContent:View{
    @StateObject var currentTime: CurrentTime = CurrentTime()
    @ObservedObject var weatherPresenter:WeatherPresenter
    
    init(weatherPresenter:WeatherPresenter){
        _weatherPresenter = ObservedObject(wrappedValue:weatherPresenter)
    }
    var body: some View{
        VStack{
            Text("\(currentTime.dateModel!.day)") .font(.system(size: 50))
                .fontWeight(.bold)
       
                .frame( maxWidth: .infinity, alignment: .leading)
            Text("\(weatherPresenter.weatherModel?.current.weather[0].main ?? "")") .font(.system(size: 47))
                .fontWeight(.light)

                .frame( maxWidth: .infinity, alignment: .leading)
            Text("\(currentTime.dateModel!.time)") .font(.system(size: 40))
                .fontWeight(.light)

                .frame( maxWidth: .infinity, alignment: .leading)
        }
        .padding([.vertical],20)
        .padding(.leading,50)
        .padding(.bottom,60)
    }
}

struct UpWeatherContent_Previews: PreviewProvider {
    static var previews: some View {
        UpWeatherContent(weatherPresenter:  container.resolve(WeatherPresenter.self)!)
    }
}
