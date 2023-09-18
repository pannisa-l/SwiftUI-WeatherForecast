//
//  WeatherForecastService.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 7/8/2566 BE.
//

import Foundation
import SwiftyJSON

class WeatherForecastService: ObservableObject {
    
    let url : String = "https://api.openweathermap.org/data/2.5/"
    let apiKey : String = "631556fef5fc60966e29819bdd4a0bdf"
    var weatherForecast = WeatherForecast()
    var errorLoad = ErrorLoad()
    var data : String = ""
    let dateFormatter = DateFormatter()
    let date = Date()
    
    func loadFivedayforecast(_ city: String,completeHandle: @escaping((_ weather: WeatherForecast)->())) {
       
        let convertCity = city.replacingOccurrences(of: " ", with: "%20")
        let urlString = "\(self.url)forecast?q=\(convertCity)&appid=\(self.apiKey)"
        
        HTTPClient.requestWithParameter(url: urlString, method: .get, params: nil) { (response, error) in
            if let error = error {
                print(error)
                completeHandle(WeatherForecast())
            }
            else {
                if let response = response {
                    let responseString = String(data: response as! Data, encoding: .utf8)
                    self.data = responseString ?? ""
                    print(self.data)
                    
                    if self.data.contains("200") {
                    let decode = try! JSONDecoder().decode(WeatherForecast.self, from:  self.data.data(using: .utf8)!)
                   
                    self.weatherForecast = decode
                    completeHandle(self.weatherForecast)
                    } else {
                        let decode = try! JSONDecoder().decode(ErrorLoad.self, from:  self.data.data(using: .utf8)!)
                        self.errorLoad = decode
                    completeHandle(WeatherForecast())
                    }
                    
                }
            }
        }
    }
}
