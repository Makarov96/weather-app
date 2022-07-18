//
//  DynamicWeatherImage.swift
//  weatherapp (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 2/06/22.
//

import SwiftUI

struct DynamicWeatherImage:  View {
    @ObservedObject var weatherPresenter:WeatherPresenter
    
    init(weatherPresenter:WeatherPresenter){
        _weatherPresenter = ObservedObject(wrappedValue:weatherPresenter)
    }
    var body: some View{
        
        switch weatherPresenter.weatherModel?.current.weather[0].main {
        case "Clear":
            Circle()
                .frame(width: 250, height: 250, alignment: .center)
                .foregroundColor(Color("sunnyColor"))
        case "Clouds":
            Image(systemName: "cloud").resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .foregroundColor(Color("rainyColor"))
        case "Rain":
            HStack{
                Image(systemName: "drop.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color("rainyColor"))
                Image(systemName: "drop.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color("rainyColor"))
                    .padding(.bottom,90)
                    .padding(.leading,20)
            }
        case "Atmosphere":
            Image(systemName: "wind").resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .foregroundColor(Color("rainyColor"))
        default:
            Circle()
                .frame(width: 250, height: 250, alignment: .center)
                .foregroundColor(Color("sunnyColor"))
            
            
        }
    }
}

struct DynamicWeatherImage_Previews: PreviewProvider {
    static var previews: some View {
        DynamicWeatherImage(weatherPresenter: container.resolve(WeatherPresenter.self)!)
    }
}
