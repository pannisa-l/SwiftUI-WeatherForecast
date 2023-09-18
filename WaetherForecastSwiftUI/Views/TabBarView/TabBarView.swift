//
//  NavigationView.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 1/8/2566 BE.
//

import SwiftUI
import MapKit

struct TabBarView: View {
    @ObservedObject var viewModel = SplashScreenViewModel()
    @State var selectedTabIndex = 0
    
    var city : String
    var latitude : Double
    var longitude : Double
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTabIndex){
                CurrentWeatherView(city: city,latitude: latitude,longtitude: longitude).tabItem {
                    selectedTabIndex == 0 ? Image(systemName: "map") : Image(systemName: "map.fill")
                }.tag(0)
                
                WeatherForecastFiveDayView().tabItem {
                    selectedTabIndex == 1 ? Image(systemName: "clock") : Image(systemName: "clock.fill")
                }.tag(0)
            }.accentColor(.green)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(city: "Newyork",latitude: 0.0,longitude: 0.0)
    }
}
