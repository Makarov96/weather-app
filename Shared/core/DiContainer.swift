//
//  DiContainer.swift
//  weatherapp
//
//  Created by Guerin Steven Colocho Chacon on 20/06/22.
//

import Foundation
import Swinject


var container: Container = {
    

    let container = Container()
    
    let resolver = container.synchronize()
    

    //utils
    container.register(LocationDevice.self){
        _ in
        return LocationDeviceInvoke();
    }
    
    //data source
    container.register(RemoteDataSource.self) { _ in
        return CoreRemoteDataStack()
    }
    // repositories
    container.register(WeatherRepository.self) { injector in
        let diRemoteDatasource = resolver.resolve(RemoteDataSource.self)!
        return WeatherRepositoryImpl(remoteDataSource: resolver.resolve(RemoteDataSource.self)!)
    }
    //Interactor
    container.register(WeatherInteractor.self) { injector in
        return  WeatherInteractor(weatherRepository: resolver.resolve(WeatherRepository.self)!)
    }
    //Presenter
    container.register(WeatherPresenter.self) { injector in
        return WeatherPresenter(weatherInteractor: resolver.resolve(WeatherInteractor.self)!)
    }
    //Router
    container.register(WeatherRouter.self){
        _ in
        return WeatherRouter()
    }

    return container
}()
