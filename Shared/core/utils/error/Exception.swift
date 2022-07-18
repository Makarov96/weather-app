//
//  Exception.swift
//  weatherapp
//
//  Created by Guerin Steven Colocho Chacon on 29/05/22.
//

import Foundation


protocol GeneralException: LocalizedError{
    var preffix:String { get set }
    var message:String { get set }
    
 
}


class ServerException: GeneralException{
    var preffix: String
    var message: String
    
    init(preffix:String, message:String) {
        self.preffix = preffix
        self.message = message
    }
    
}

class InvalidParamException:GeneralException{
    var preffix: String
    var message: String
    
    init(preffix:String, message:String) {
        self.preffix = preffix
        self.message = message
    }
}
