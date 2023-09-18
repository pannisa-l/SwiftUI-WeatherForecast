//
//  ForecastViewmodel.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 8/8/2566 BE.
//

import Foundation

class ForecastListDetailsViewModel : ObservableObject {
    @Published var weatherForecastViewModel = WeatherForecastViewModel()
    
    @Published var fivedayForecast : FivedayForecast = FivedayForecast()
    @Published var time : [String] = []
    
    func convertDateTime(listForecast: FivedayForecast) {
        self.fivedayForecast = listForecast
        let date = Date()
        let formatter = DateFormatter()
        var timeString : String
        
        for i in 0..<listForecast.weatherData.count {
            self.fivedayForecast = listForecast
            print(listForecast.weatherData.count)
            formatter.timeStyle = .short
            formatter.timeZone = TimeZone(identifier: "US")
            
            let dateTime = formatter.date(from: listForecast.weatherData[i].date ?? "")
            timeString = formatter.string(from: dateTime ?? date)
            print(timeString)
//            formatter.string(from: listForecast.weatherData[i].date)
//            timeString = formatter.string(from: date)
//            print(timeString)
//            time.append(timeString,in)
            print(self.fivedayForecast.weatherData[i])
            self.fivedayForecast.weatherData[i].timeForDisplay.append(contentsOf: timeString)
//            self.fivedayForecast.weatherData[i].dateForDisplay = timeString
            print(self.fivedayForecast.weatherData[i].timeForDisplay)
            print(self.fivedayForecast.weatherData)
        }
    }
    
}
