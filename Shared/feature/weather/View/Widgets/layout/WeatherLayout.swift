//
//  WeatherLayout.swift
//  weatherapp (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 2/06/22.
//

import SwiftUI


var cron:Cron = Cron(every: 1800)
struct WeatherLayout:View{
    @Environment(\.scenePhase) private var scenePhase
    @State var statusDay:StatusDay
    @ObservedObject var weatherRouter: WeatherRouter = WeatherRouter()

    var body: some View{
        GeometryReader{
            geometry in
            let height = geometry.size.height
           // let width = geometry.size.width
            ZStack{
                switch statusDay {
                case .night:
                    Color("backgroundColor").opacity(0.6).ignoresSafeArea()
                case .day:
                    Color.white.ignoresSafeArea()
                }
                ScrollView(showsIndicators:false){
                    VStack(alignment: .center){
                        weatherRouter.contentDynamicUp?.view
                        Spacer()
                        weatherRouter.contentdynamicImage?.view
                        Spacer(minLength: 130)
                        weatherRouter.contentBottom?.view
                    }
                }
            }.onChange(of: scenePhase) { newPhase in
                    //TODO: Solved entry some times
                if newPhase == .active {
                    weatherRouter.setUp(height: height)
                }
            }
            .onAppear{
                cron.start {
                    self.weatherRouter.setUp(height: height)
                }
            }
        }

    }
}

struct WeatherLayout_Previews: PreviewProvider {
    static var previews: some View {
        WeatherLayout(statusDay: .day)
    }
}
