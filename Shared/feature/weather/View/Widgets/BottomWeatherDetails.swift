//
//  BottomWeatherDetails.swift
//  weatherapp (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 2/06/22.
//

import SwiftUI





struct BottomWeatherDetails: View{
    @ObservedObject var weatherPresenter:WeatherPresenter

    init(weatherPresenter:WeatherPresenter){
     _weatherPresenter = ObservedObject(wrappedValue:weatherPresenter)
    }

    var body: some View{
        if weatherPresenter.weatherModel != nil {
            HStack(alignment:.top){
                
                VStack{
                
                    Text("\(String(format: "%.0f", weatherPresenter.weatherModel?.current.temp ?? 0))°")
                        .font(.system(size: 90))
                        .fontWeight(.medium)
                        .frame( maxWidth: .infinity, alignment: .trailing)
                    
                    HStack(spacing:30){
                        
                        //   HStack{
                        //       Text("96")
                        //           .font(.subheadline)
                        //           .fontWeight(.medium)
                        //
                        //       Image(systemName: "arrowtriangle.down.fill")
                        //           .foregroundColor(.gray)
                        //
                        //   }
                        //   HStack{
                        //       Text("10")
                        //           .font(.subheadline)
                        //           .fontWeight(.medium)
                        //
                        //       Image(systemName: "arrowtriangle.up.fill")
                        //           .foregroundColor(.gray)
                        //   }
                        
                        
                    }
                    .padding(.leading,20)
                    .frame( maxWidth: .infinity, alignment: .center)
                }
                
                VStack{
                    Text("weatherDetails")
                        .font(.title2)
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity,  alignment: .leading)
                    
                    Rectangle()
                    
                        .frame(width:210,height: 2, alignment: .trailing)
                        .frame(maxWidth: .infinity,  alignment: .trailing)
                        .edgesIgnoringSafeArea(.horizontal).clipShape(RoundedRectangle(cornerRadius: 50))
                    
                    HStack{
                        Text("feelLike")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                            .frame( maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Text("\(String(format: "%.2f", weatherPresenter.weatherModel?.current.feelsLike ?? 0))°")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                            .frame( maxWidth: .infinity, alignment: .leading)
                    }
                    HStack{
                        Text("humidity")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                            .frame( maxWidth: .infinity, alignment: .leading)
                        Text("\(weatherPresenter.weatherModel?.current.humidity ?? 0) %")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                            .frame( maxWidth: .infinity, alignment: .leading)
                    }
                    HStack{
                        Text("wind")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .frame( maxWidth: .infinity, alignment: .leading)
                        Text("\(weatherPresenter.weatherModel?.current.windDeg ?? 0) km/h")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .frame( maxWidth: .infinity, alignment: .leading)
                    }
                    HStack{
                        Text("velocity")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                            .frame( maxWidth: .infinity, alignment: .leading)
                        Text("\(String(format: "%.2f",weatherPresenter.weatherModel?.current.windSpeed ?? 0.0 )) km")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                            .frame( maxWidth: .infinity, alignment: .leading)
                    }
                    
                    
                }
            }
        }else{
            ProgressView()
        }

    }
    

    
}

struct BottomWeatherDetails_Previews: PreviewProvider {
    static var previews: some View {
        BottomWeatherDetails(weatherPresenter:  container.resolve(WeatherPresenter.self)!)
    }
}
