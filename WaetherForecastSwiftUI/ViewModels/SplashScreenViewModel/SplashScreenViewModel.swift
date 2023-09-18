//
//  TabViewModel.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 9/8/2566 BE.
//

import Foundation
import CoreLocation

class SplashScreenViewModel: ObservableObject {
    
    @Published var location : String = ""
    @Published var latitude : Double = 0.0
    @Published var longitude : Double = 0.0
    @Published var locationManager = LocationManager()
    
    func getLatLonLocation() {
        UserDefaults.standard.removeObject(forKey: "Location")
        switch locationManager.locationManager.authorizationStatus {
        case .authorizedWhenInUse:
            latitude = locationManager.locationManager.location?.coordinate.latitude ?? 0.0
            longitude = locationManager.locationManager.location?.coordinate.longitude ?? 0.0
        case .restricted, .denied:
            break// Location services currently unavailable.
        case .notDetermined:
            break// Authorization not determined yet.
        default:
            print("default")
            break
        }
    }
    
    
    func getDefaultLocationCity() {
        let getLocation = UserDefaults.standard.object(forKey: "Location") as? String ?? ""
            location = getLocation
        print("getDefaultLocationCity \(location)")
    }
}
