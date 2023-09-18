//
//  CurrentWaetherViewModel.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 31/7/2566 BE.
//

import Foundation
import SwiftUI
import Kingfisher
//import UIKit


class CurrentWaetherViewModel: ObservableObject {
    @Published var currentWaetherService = CurrentWaetherService()
   

    var weatherItem = WeatherItem()
    var displayWeatherItem = DisplayWeatherItem()
    var city : String = "Bangkok"
    var imgIcon: Image?
    
    func getCurrentWeather(_ city: String){
        currentWaetherService.loadCurrentWeather(city, completeHandle: { (data) in
            DispatchQueue.main.async {
                self.weatherItem = data
                if self.weatherItem.cod == 200 {
                    self.displayWeatherItem.main = "\(self.weatherItem.weather?[0].main ?? "")"
                    self.displayWeatherItem.temp = Int((self.weatherItem.main?.temp ?? 0.0) - 273.15)
                    self.displayWeatherItem.description = "\(self.weatherItem.weather?[0].description ?? "")"
                    self.displayWeatherItem.humidity = "\(self.weatherItem.main?.humidity ?? 0)%"
                } else {
                    self.displayWeatherItem.temp = 0
                }
            }
            })
    }
    
//    func getIcon(_ id:String,completeHandle: @escaping((_ imageWeather: Image)->())){
//        let url = URL(string: "https://openweathermap.org/img/wn/\(id)@4x.png")
////        self.imgIcon = KF.url(url)
////        completeHandle()
//
////        KingfisherManager.shared.retrieveImage(with: url, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
////            print(image)
////        })
//
//        KingfisherManager.shared.retrieveImage(with: url) { result in
//            let image = try? result.get().image
//            if let image = image {
//                imgIcon = image
//            }
//        }
//    }
}


