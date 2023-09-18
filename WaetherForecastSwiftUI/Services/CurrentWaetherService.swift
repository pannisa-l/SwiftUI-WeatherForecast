//
//  CurrentWaetherService.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 31/7/2566 BE.
//

import Foundation
import SwiftyJSON

class CurrentWaetherService: ObservableObject {
    
    let url : String = "https://api.openweathermap.org/data/2.5/"
    let apiKey : String = "631556fef5fc60966e29819bdd4a0bdf"
    var weatherItem = WeatherItem()
    var errorLoad = ErrorLoad()
    var data : String = ""
    let dateFormatter = DateFormatter()
    let date = Date()
    @Published var typesOfAPI : TypesOfAPI = .loading

    func loadCurrentWeather(_ city: String,completeHandle: @escaping((_ weather: WeatherItem)->())){
        
        let convertCity = city.replacingOccurrences(of: " ", with: "%20")
        let urlString = "\(self.url)weather?q=\(convertCity)&appid=\(self.apiKey)"

        HTTPClient.requestWithParameter(url: urlString, method: .get, params: nil) { (response, error) in
            if let error = error {
                print(error)
                completeHandle(WeatherItem())
            }
            else {
                if let response = response {
                    let responseString = String(data: response as! Data, encoding: .utf8)
                    self.data = responseString ?? ""
                    if self.data.contains("200") {
                    let decode = try! JSONDecoder().decode(WeatherItem.self, from:  self.data.data(using: .utf8)!)
                   
                    self.weatherItem = decode
                    self.typesOfAPI = .success
                    completeHandle(self.weatherItem)
                    } else {
                        let decode = try! JSONDecoder().decode(ErrorLoad.self, from:  self.data.data(using: .utf8)!)
                        self.errorLoad = decode
                        self.typesOfAPI = .failed
                    completeHandle(WeatherItem())
                    }
                }
            }
        }
    }
    
    func loadCurrentWeatherByLatLon(_ lat: Double,_ lon: Double,completeHandle: @escaping((_ weather: WeatherItem)->())){
        
        let urlString = "\(self.url)weather?lat=\(lat)&lon=\(lon)&appid=\(self.apiKey)"

        HTTPClient.requestWithParameter(url: urlString, method: .get, params: nil) { (response, error) in
            if let error = error {
                print(error)
                completeHandle(WeatherItem())
            }
            else {
                if let response = response {
                    let responseString = String(data: response as! Data, encoding: .utf8)
                    self.data = responseString ?? ""
                    if self.data.contains("200") {
                    let decode = try! JSONDecoder().decode(WeatherItem.self, from:  self.data.data(using: .utf8)!)
                   
                    self.weatherItem = decode
                    self.typesOfAPI = .success
                    completeHandle(self.weatherItem)
                    } else {
                        let decode = try! JSONDecoder().decode(ErrorLoad.self, from:  self.data.data(using: .utf8)!)
                        self.errorLoad = decode
                        self.typesOfAPI = .success
                    completeHandle(WeatherItem())
                    }
                }
            }
        }
    }
}
