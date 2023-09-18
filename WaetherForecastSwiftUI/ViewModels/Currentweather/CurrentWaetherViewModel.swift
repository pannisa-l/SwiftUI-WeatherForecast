//
//  CurrentWaetherViewModel.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 31/7/2566 BE.
//

import Foundation
import SwiftUI
import Kingfisher

class CurrentWaetherViewModel: ObservableObject {
    @Published var currentWaetherService = CurrentWaetherService()
  
    var weatherItem = WeatherItem()
    @Published var displayWeatherItem = DisplayWeatherItem()
    @Published var urlImg = URL(string: "")
    @Published var loadingViewMap : Bool = false
    @Published var alertForNotFoundData : Bool = false
    @Published var typesOfAPI : TypesOfAPI = .loading
    
    func getCurrentWeather(city: String){
        currentWaetherService.loadCurrentWeather(city, completeHandle: { (data) in
            DispatchQueue.main.async {
                self.weatherItem = data
                self.typesOfAPI = self.currentWaetherService.typesOfAPI
                if self.weatherItem.cod == 200 {
                    UserDefaults.standard.set(self.weatherItem.name, forKey: "Location")
                    UserDefaults.standard.synchronize()
                    self.displayWeatherItem.cityName = "\(self.weatherItem.name ?? "")"
                    self.displayWeatherItem.temp = Int((self.weatherItem.main?.temp ?? 0.0) - 273.15)
                    self.displayWeatherItem.description = "\(self.weatherItem.weather?[0].description ?? "")"
                    self.displayWeatherItem.lat = self.weatherItem.coord?.lat ?? 0.0
                    self.displayWeatherItem.lon = self.weatherItem.coord?.lon ?? 0.0
                    self.urlImg = URL(string: "https://openweathermap.org/img/wn/\(self.weatherItem.weather?[0].icon ?? "")@4x.png")
                    self.convertUnixTime(sunrise: self.weatherItem.sys?.sunrise ?? 0,sunset: self.weatherItem.sys?.sunset ?? 0)
                    self.typesOfAPI = .success
                    self.loadingViewMap = true
                    self.alertForNotFoundData = false
                } else {
                    self.displayWeatherItem.cityName = "No data found"
                    self.displayWeatherItem.temp = 0
                    self.displayWeatherItem.description = "No data found"
                    self.displayWeatherItem.lat = 0.0
                    self.displayWeatherItem.lon = 0.0
                    self.urlImg = URL(string: "")
                    self.convertUnixTime(sunrise: 0,sunset: 0)
                    self.typesOfAPI = .success
                    self.loadingViewMap = false
                    self.alertForNotFoundData = true
                }
            }
            })
    }
    
    func getCurrentWeatherBylatlon(lat: Double,lon: Double){
        currentWaetherService.loadCurrentWeatherByLatLon(lat,lon, completeHandle: { (data) in
            DispatchQueue.main.async {
                self.weatherItem = data
                self.typesOfAPI = self.currentWaetherService.typesOfAPI

                if self.weatherItem.cod == 200 {
                    UserDefaults.standard.set(self.weatherItem.name, forKey: "Location")
                    UserDefaults.standard.synchronize()
                    self.displayWeatherItem.cityName = "\(self.weatherItem.name ?? "")"
                    self.displayWeatherItem.temp = Int((self.weatherItem.main?.temp ?? 0.0) - 273.15)
                    self.displayWeatherItem.description = "\(self.weatherItem.weather?[0].description ?? "")"
                    self.displayWeatherItem.lat = self.weatherItem.coord?.lat ?? 0.0
                    self.displayWeatherItem.lon = self.weatherItem.coord?.lon ?? 0.0
                    self.urlImg = URL(string: "https://openweathermap.org/img/wn/\(self.weatherItem.weather?[0].icon ?? "")@4x.png")
                    self.loadingViewMap = true
                    self.alertForNotFoundData = false
                    self.convertUnixTime(sunrise: self.weatherItem.sys?.sunrise ?? 0,sunset: self.weatherItem.sys?.sunset ?? 0)
                } else {
                    self.displayWeatherItem.cityName = "No data found"
                    self.displayWeatherItem.temp = 0
                    self.displayWeatherItem.description = "No data found"
                    self.displayWeatherItem.lat = 0.0
                    self.displayWeatherItem.lon = 0.0
                    self.urlImg = URL(string: "")
                    self.convertUnixTime(sunrise: 0,sunset: 0)
                    self.typesOfAPI = .success
                    self.loadingViewMap = false
                    self.alertForNotFoundData = true
                }
            }
            })
    }
    
    func convertUnixTime(sunrise: Int,sunset: Int) {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.timeZone = TimeZone(identifier: "US")

        let unixTimeSunrise = sunrise
        let dateSunrise = Date(timeIntervalSince1970: TimeInterval(unixTimeSunrise))
        
        let unixTimeSunset = sunset
        let dateSunset = Date(timeIntervalSince1970: TimeInterval(unixTimeSunset))
        
        self.displayWeatherItem.sunrise = formatter.string(from: dateSunrise)
        self.displayWeatherItem.sunset = formatter.string(from: dateSunset)
    }
}


