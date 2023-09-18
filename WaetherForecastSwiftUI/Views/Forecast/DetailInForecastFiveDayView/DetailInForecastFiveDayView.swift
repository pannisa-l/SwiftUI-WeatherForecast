//
//  ForecastDetailView.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 8/8/2566 BE.
//

import Foundation
import SwiftUI
import Kingfisher

struct DetailInForcastFiveDayView: View {
    @ObservedObject var viewModel = ForecastDetailViewModel()
    @Environment(\.dismiss) var dismiss
    
    let fivedayForecast : [FivedayForecast]
    let indexList : Int
    let day : String
    
    var body: some View {
        NavigationView {
            VStack {
                List(0..<viewModel.listTimeForDisplay.count, id:\.self) { i in
                    VStack(alignment: .leading){
                        Text("\(Int((viewModel.listTimeForDisplay[i].temp ?? 0) - 273.15)) °C")
                        Text("Day \(viewModel.listTimeForDisplay[i].description ?? "")")
                    }
                }
                
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .toolbar(.hidden, for: .tabBar)
                .navigationBarTitle("Forecast Detail", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left").imageScale(.large)
                        Text("\(day)")
                    }
                })
        }.onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                self.viewModel.getListData(listForecast: fivedayForecast, index: indexList)
            })
        }).navigationBarBackButtonHidden(true)
    }
}

struct DetailInForcastFiveDayView_Previews: PreviewProvider {
    @State static var fivelist = [FivedayForecast(day: "Monday", weatherData: [WeatherData(temp: 300.34, description: "light rain", icon: "10n", date: "2023-08-09 09:00:00"),WeatherData(temp: 300.34, description: "light rain", icon: "10n", date: "2023-08-09 12:00:00"),WeatherData(temp: 300.34, description: "light rain", icon: "10n", date: "2023-08-09 15:00:00"),WeatherData(temp: 300.34, description: "light rain", icon: "10n", date: "2023-08-09 18:00:00"),WeatherData(temp: 300.34, description: "light rain", icon: "10n", date: "2023-08-09 21:00:00")], cod: 200)]
    
    static var previews: some View {
        DetailInForcastFiveDayView(fivedayForecast: fivelist, indexList: 0, day: "Mon")
    }
}
