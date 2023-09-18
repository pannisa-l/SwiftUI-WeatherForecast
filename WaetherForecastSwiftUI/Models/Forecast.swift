//
//  Forecast.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 31/7/2566 BE.
//

import Foundation
import SwiftyJSON


struct WeatherData: Codable{
    var temp: Double?
    var description: String?
    var icon: String?
    var date: String?
    var timeForDisplay: String = ""
    var temp_min : Double?
    var temp_max : Double?
}

struct FivedayForecast: Codable{
    var day: String?
    var weatherData : [WeatherData] = []
    var cod : Int? = 0
}

struct WeatherForecast : Codable {
    var city : City?
    var list : [WeatherList] = []
    var cod : String? = ""
}

struct City : Codable {
    var name: String?
    
}

struct WeatherList : Codable {
    var main: MainForecast?
    var weather: [WeatherFiveday]?
    var dt_txt: String?
}

struct MainForecast : Codable {
    var humidity: Int?
    var temp: Double?
    var temp_min : Double?
    var temp_max : Double?
}

struct WeatherFiveday: Codable {
    var id : Int?
    var main: String?
    var description : String?
    var icon : String?
}
