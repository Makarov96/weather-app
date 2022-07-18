//
//  CurrentDate.swift
//  weatherapp (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 17/07/22.
//

import Foundation

struct DateModel:Hashable{
    var time:String
    var day:String
    
}

class CurrentTime: ObservableObject{
    private var date = Date()
    private var components = Calendar.current.dateComponents([.day,.hour, .minute], from: Date.now)
    private var dateFormatter = DateFormatter()
    @Published var dateModel:DateModel?
    
    init(){
      setUp()
    }
    
    func setUp(){
       dateModel =  DateModel(time: setUpTime(), day: setUpDay())
    }
    
    func setUpTime()->String{
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    func setUpDay()->String{
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
        
    }
}
