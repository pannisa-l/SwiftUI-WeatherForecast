//
//  Weather.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 31/7/2566 BE.
//

import Foundation
import SwiftyJSON

enum TypesOfAPI : String {
    case success = "Success"
    case loading = "Loading"
    case failed = "Failed"
}


enum TypesOfLocation : String {
    case waiting = "Waiting"
    case authorizedWhenInUse = "AuthorizedWhenInUse"
    case restricted = "Restricted"
    case notDetermined = "NotDetermined"
}

struct CurrentLocation: Codable {
    var lat : Double?
    var lon : Double?
}
struct ErrorLoad: Codable {
    var cod : String?
    var message : String?
}

struct WeatherItem : Codable {
    var name : String? = ""
    var weather: [Weather]? = []
    var main : Main?
    var cod : Int? = 0
    var sys: Sys?
    var coord : Coord?
}

struct Coord : Codable  {
    var lon : Double?
    var lat: Double?
}

struct Weather : Codable  {
    var id : Int?
    var main: String?
    var description : String?
    var icon : String?
}

struct Sys : Codable  {
    var country : String?
    var sunrise : Int?
    var sunset : Int?
}

struct Main : Codable  {
    var humidity: Int?
    var temp_max: Double?
    var temp_min: Double?
    var feels_like: Double?
    var pressure: Double?
    var temp: Double?
}

struct DisplayWeatherItem : Codable {
    var cityName: String?
    var main: String?
    var description : String?
    var icon : String?
    var humidity: String?
    var temp_max: Int?
    var temp_min: Int?
    var feels_like: Int?
    var sunrise: String?
    var sunset: String?
    var pressure: Int?
    var temp: Int?
    var lon : Double = 0.0
    var lat: Double = 0.0

}
