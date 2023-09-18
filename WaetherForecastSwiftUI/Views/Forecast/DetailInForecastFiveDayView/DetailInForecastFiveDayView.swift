//
//  ForecastDetailView.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 8/8/2566 BE.
//

import Foundation
import SwiftUI
import Kingfisher

struct DetailInForecastFiveDayView: View {
    @ObservedObject var viewModel = ForecastListDetailsViewModel()
    @Environment(\.dismiss) var dismiss
    
    let fivedayForecast : FivedayForecast
    let indexList : Int
    
    var body: some View {
        NavigationView {
            VStack {
                List(0..<fivedayForecast.weatherData.count, id:\.self) { i in
                    VStack(alignment: .leading){
                        HStack{
                            Text("Time: \(fivedayForecast.weatherData[i].timeForDisplay)").textLightBlack16()
                            Text("Temperature \(Int((fivedayForecast.weatherData[i].temp ?? 0) - 273.15))°").textLightBlack16()
                        }
                        Text(fivedayForecast.weatherData[i].description).textLightBlack16()
                        Text("Minimum forecast temperature \(Int((fivedayForecast.weatherData[i].temp_min ?? 0) - 273.15))°").textLightBlack16()
                        Text("Maximum forecast temperature \(Int((fivedayForecast.weatherData[i].temp_max ?? 0) - 273.15))°").textLightBlack16()
                    }
                }
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .toolbar(.hidden, for: .tabBar)
                .navigationBarTitle(fivedayForecast.day ?? "", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                                        Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left").imageScale(.large)
                        Text("")
                    }
                })
        }.navigationBarBackButtonHidden(true)
    }
}

struct DetailInForecastFiveDayView_Previews: PreviewProvider {
    @State static var fivelist = FivedayForecast(day: "Monday", weatherData: [WeatherData(temp: 300.34, description: "light rain", icon: "10n", date: "2023-08-09 09:00:00"),WeatherData(temp: 300.34, description: "light rain", icon: "10n", date: "2023-08-09 12:00:00"),WeatherData(temp: 300.34, description: "light rain", icon: "10n", date: "2023-08-09 15:00:00"),WeatherData(temp: 300.34, description: "light rain", icon: "10n", date: "2023-08-09 18:00:00"),WeatherData(temp: 300.34, description: "light rain", icon: "10n", date: "2023-08-09 21:00:00")], cod: 200)
    
    static var previews: some View {
        DetailInForecastFiveDayView(fivedayForecast: fivelist, indexList: 0)
    }
}
