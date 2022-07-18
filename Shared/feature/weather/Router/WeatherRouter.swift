//
//  WeatherRouter.swift
//  weatherapp (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 26/06/22.
//

import Foundation
import SwiftUI




struct Content {
    var view: AnyView
    init<V>(contentView:V) where V:View{
        view = AnyView(contentView)
    }
}

//If you whant view the change on the view you can mark how ObservableObject
class WeatherRouter:ObservableObject{
    //If you whant view the change on the view you can mark how @Published
    @Published var weatherPresenter:WeatherPresenter?
    var contentBottom:Content?
    var contentdynamicImage:Content?
    var contentDynamicUp:Content?
    
    
    func setUp(height: CGFloat){
        weatherPresenter =  container.resolve(WeatherPresenter.self)!
        contentBottom = Content(contentView: BottomWeatherDetails(weatherPresenter: weatherPresenter!))
        contentdynamicImage = Content(contentView: DynamicWeatherImage(weatherPresenter:weatherPresenter!).frame(height: height*0.26))
        contentDynamicUp = Content(contentView: UpWeatherContent(weatherPresenter:weatherPresenter!))
        
        
    }
    
}


