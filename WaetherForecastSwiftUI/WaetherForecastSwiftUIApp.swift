//
//  WaetherForecastSwiftUIApp.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 31/7/2566 BE.
//

import SwiftUI
import GoogleMaps

@main
struct WaetherForecastSwiftUIApp: App {
    
    init(){
        GMSServices.provideAPIKey("AIzaSyBaHIrjI7_VhXjSj-BFJO_QKBpEWb_Ah_M")
        UITabBar.appearance().barTintColor = UIColor(Color.white)
        UITabBar.appearance().backgroundColor = UIColor(Color.white)
    }
    
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
//            TabBarView()
        }
    }
}
