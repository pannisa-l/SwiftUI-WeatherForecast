//
//  MapView.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 21/8/2566 BE.
//

import SwiftUI
import GoogleMaps

struct MapView: View {
    
    @State var screenUtil = ScreenUtil()
    var latitude: Double = 0.0
    var longtitude: Double = 0.0
    var location: String = "" 
    
    var body: some View {
        VStack{
            GoogleMapView(lat: latitude, lon: longtitude,location: location)
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
    }

}
