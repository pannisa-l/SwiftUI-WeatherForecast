//
//  ForecastViewmodel.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 8/8/2566 BE.
//

import Foundation

class ForecastListDetailsViewModel : ObservableObject {
    @Published var weatherForecastViewModel = WeatherForecastViewModel()
    
    @Published var listTimeForDisplay = [WeatherData]()
    
    func getListData(listForecast: [FivedayForecast] ,index: Int) {
        for f in 0..<listForecast[index].weatherData.count {
            print(listForecast[index].weatherData)
            print(listForecast[index].weatherData[f])
            listTimeForDisplay.append(listForecast[index].weatherData[f])
        }
    }
    
}
