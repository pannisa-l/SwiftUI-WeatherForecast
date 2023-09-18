//
//  getLocation.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 15/8/2566 BE.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
   // @Published var classLocation = LocationManager()
    
    var locationManager = CLLocationManager()
     @Published var authorizationStatus: String?
    
     override init() {
         super.init()
         locationManager.delegate = self
     }
     
     func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
         switch manager.authorizationStatus {
         case .authorizedWhenInUse:  // Location services are available.
             // Insert code here of what should happen when Location services are authorized
             authorizationStatus = "authorizedWhenInUse"
             locationManager.requestLocation()
//             print("status authorizedWhenInUse")
 //            NotificationCenter.default.post(name: NSNotification.Name("statusLocationChange"), object: nil)
             break
         case .restricted:  // Location services currently unavailable.
             // Insert code here of what should happen when Location services are NOT authorized
            authorizationStatus = "restricted"
             print("status restricted")
             break
             
         case .denied:  // Location services currently unavailable.
             // Insert code here of what should happen when Location services are NOT authorized
            authorizationStatus = "denied"
             print("status denied")
             break
             
         case .notDetermined:        // Authorization not determined yet.
             authorizationStatus = "notDetermined"
             manager.requestWhenInUseAuthorization()
//             NotificationCenter.default.post(name: NSNotification.Name("statusLocationChange"), object: nil)
             print("status notDetermined")
             break
         default:
             break
         }
     }
     
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         // Insert code to handle location updates
//         guard let location = locations.last else {
//                     return
//                 }
//
//                 let locationAge = -location.timestamp.timeIntervalSinceNow
//                 if locationAge > 10.0 { //10 seconds
//                     return
//                 }
//                 if location.horizontalAccuracy < 0 {
//                     return
//                 }
//                print("Location :- \(location.coordinate)")
                 //location updated
         NotificationCenter.default.post(name: NSNotification.Name("statusLocationChange"), object: nil)
//         print("didUpdateLocations")
         locationManager.stopUpdatingLocation()
     }
     
     func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         print("error: \(error.localizedDescription)")
     }
     
}
