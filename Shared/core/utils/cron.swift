//
//  cron.swift
//  weatherapp (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 3/07/22.
//

import Foundation




typealias ExecuteEvent = () -> Void

class Cron{
   
    let timer : DispatchSourceTimer = DispatchSource.makeTimerSource(flags: [], queue:.global(qos: .background))
    
    init(every:Int){
        timer.schedule(deadline: .now(), repeating: .seconds(every))
        timer.activate()
    }
    
    func start(executeEvente:@escaping ExecuteEvent){
        timer.setEventHandler(handler:executeEvente)
    }
    
    func cancel(){
        timer.cancel()
    }
    
    func resume(){
        if timer.isCancelled{
            timer.activate()

        }
    }
    

}
