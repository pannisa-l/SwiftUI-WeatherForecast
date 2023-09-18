//
//  NavigationView.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 1/8/2566 BE.
//

import SwiftUI

struct TabBarView: View {
    
    @State var selectedTabIndex = 0
    
    var body: some View {
            TabView(selection: $selectedTabIndex){
                
                CurrentWeatherView().tabItem {
                    selectedTabIndex == 0 ? Image(systemName: "map") : Image(systemName: "map.fill")
                }.tag(0)
                
                WeatherForecastView().tabItem {
                    selectedTabIndex == 1 ? Image(systemName: "paperplane") : Image(systemName: "paperplane.fill")
                }.tag(1)
            }.accentColor(.green)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
