//
//  WaetherForecastViewModel.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 7/8/2566 BE.
//

import Foundation
import SwiftUI

class WeatherForecastViewModel : ObservableObject {
    @Published var weatherForecastService = WeatherForecastService()
    @Published var splashScreenViewModel = SplashScreenViewModel()
    
    @Published var fivedayForecast = [FivedayForecast]()
    var weatherForecast = WeatherForecast()
    let dateFormatter = DateFormatter()
    let timeFormatter = DateFormatter()
    let date = Date()
    
    func getCurrentWeatherForecast(location: String){
        weatherForecastService.loadFivedayforecast(location, completeHandle: { (data) in
            DispatchQueue.main.async {
                self.weatherForecast = data
                if self.weatherForecast.cod == "200" {
                    var totalData = self.weatherForecast.list.count
                    let loop = self.weatherForecast.list.count - 1
                    self.dateFormatter.locale = Locale(identifier: "en")
                    self.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    self.timeFormatter.timeStyle = .short
                    
                    var forecastmodelArray : [FivedayForecast] = []
                    var currentDayTemp = FivedayForecast(day: "", weatherData: [])
                    var secondDayTemp = FivedayForecast(day: "", weatherData: [])
                    var thirdDayTemp = FivedayForecast(day: "", weatherData: [])
                    var fourthDayTemp = FivedayForecast(day: "", weatherData: [])
                    var fifthDayTemp = FivedayForecast(day: "", weatherData: [])
                    var fetchedData : [WeatherData] = []
                    var currentDayForecast : [WeatherData] = []
                    var secondDayForecast : [WeatherData] = []
                    var thirddayDayForecast : [WeatherData] = []
                    var fourthDayDayForecast : [WeatherData] = []
                    var fifthDayForecast : [WeatherData] = []
                    var sixthDayForecast : [WeatherData] = []
                    
                    for day in 0...loop {
                        
                        let temp = self.weatherForecast.list[day].main?.temp
                        let descrip = self.weatherForecast.list[day].weather?[0].description
                        let icon = self.weatherForecast.list[day].weather?[0].icon
                        let dt_txt = self.weatherForecast.list[day].dt_txt
                        let date = self.dateFormatter.date(from: self.weatherForecast.list[day].dt_txt ?? "")
                        let timeFordisplay = self.timeFormatter.string(from: date ?? self.date)
                        let temp_min = self.weatherForecast.list[day].main?.temp_min
                        let temp_max = self.weatherForecast.list[day].main?.temp_max
                        let calendar = Calendar.current
                        let components = calendar.dateComponents([.weekday], from: date!)
                        let weekdaycomponent = components.weekday! - 1
                        
                        let weekday = self.dateFormatter.weekdaySymbols[weekdaycomponent]
                        let currentDayComponent = calendar.dateComponents([.weekday], from: Date())
                        let currentWeekDay = currentDayComponent.weekday! - 1
                        let currentweekdaysymbol = self.dateFormatter.weekdaySymbols[currentWeekDay]
                        
                        
                       
                        
                        if weekdaycomponent == currentWeekDay - 1 {
                            totalData = totalData - 1
                        }
                        
                        if weekdaycomponent == currentWeekDay {
                            let info = WeatherData(temp: temp, description: descrip, icon: icon, date: dt_txt,timeForDisplay: timeFordisplay, temp_min: temp_min, temp_max: temp_max)
                            currentDayForecast.append(info)
                            currentDayTemp = FivedayForecast(day: currentweekdaysymbol, weatherData: currentDayForecast)
                            fetchedData.append(info)
                        }else if weekdaycomponent == currentWeekDay.incrementWeekDays(by: 1) {
                            let info = WeatherData(temp: temp, description: descrip, icon: icon, date: dt_txt,timeForDisplay: timeFordisplay, temp_min: temp_min, temp_max: temp_max)
                            secondDayForecast.append(info)
                            secondDayTemp = FivedayForecast(day: weekday, weatherData: secondDayForecast)
                            fetchedData.append(info)
                        }else if weekdaycomponent == currentWeekDay.incrementWeekDays(by: 2) {
                            let info = WeatherData(temp: temp, description: descrip, icon: icon, date: dt_txt,timeForDisplay: timeFordisplay, temp_min: temp_min, temp_max: temp_max)
                            thirddayDayForecast.append(info)
                            thirdDayTemp = FivedayForecast(day: weekday, weatherData: thirddayDayForecast)
                            fetchedData.append(info)
                        }
                        else if weekdaycomponent == currentWeekDay.incrementWeekDays(by: 3) {
                            let info = WeatherData(temp: temp, description: descrip, icon: icon, date: dt_txt,timeForDisplay: timeFordisplay, temp_min: temp_min, temp_max: temp_max)
                            fourthDayDayForecast.append(info)
                            fourthDayTemp = FivedayForecast(day: weekday, weatherData: fourthDayDayForecast)
                            fetchedData.append(info)
                        }else if weekdaycomponent == currentWeekDay.incrementWeekDays(by: 4){
                            let info = WeatherData(temp: temp, description: descrip, icon: icon, date: dt_txt,timeForDisplay: timeFordisplay, temp_min: temp_min, temp_max: temp_max)
                            fifthDayForecast.append(info)
                            fifthDayTemp = FivedayForecast(day: weekday, weatherData: fifthDayForecast)
                            fetchedData.append(info)
                        }
                        else if weekdaycomponent == currentWeekDay.incrementWeekDays(by: 5) {
                            let info = WeatherData(temp: temp, description: descrip, icon: icon, date: dt_txt,timeForDisplay: timeFordisplay, temp_min: temp_min, temp_max: temp_max)
                            sixthDayForecast.append(info)
                            fetchedData.append(info)
                        }
                        
                        if fetchedData.count == totalData {
                            
                            if currentDayTemp.weatherData.count > 0 {
                                forecastmodelArray.append(currentDayTemp)
                            }
                            
                            if secondDayTemp.weatherData.count > 0 {
                                forecastmodelArray.append(secondDayTemp)
                            }
                            
                            if thirdDayTemp.weatherData.count > 0 {
                                forecastmodelArray.append(thirdDayTemp)
                            }
                            
                            if fourthDayTemp.weatherData.count > 0 {
                                forecastmodelArray.append(fourthDayTemp)
                            }
                            
                            if fifthDayTemp.weatherData.count > 0 {
                                forecastmodelArray.append(fifthDayTemp)
                            }
                            if forecastmodelArray.count <= 5 {
                                self.fivedayForecast = forecastmodelArray
                            }
                        }
                    }
                }
            }
        })
    }
    
    
}
