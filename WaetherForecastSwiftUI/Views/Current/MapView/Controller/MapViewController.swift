//
//  MapViewController.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 17/8/2566 BE.
//

import GoogleMaps
import SwiftUI
import UIKit


struct GoogleMapView: UIViewRepresentable {

    var lat : Double
    var lon : Double
    var location : String

    func makeUIView(context: Self.Context) -> GMSMapView {
        let position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let camera = GMSCameraPosition.camera(withLatitude: self.lat, longitude: self.lon, zoom: 16)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        let marker = GMSMarker(position: position)
        marker.title = "Lat: \(lat) Lon: \(lon)"
//        marker.snippet = location
        marker.map = mapView
        print("create \(location) ")
        return mapView
    }
    

    func updateUIView(_ mapView: GMSMapView, context: Context) {
        mapView.clear()
        let position = CLLocationCoordinate2D(latitude: self.lat, longitude: self.lon)
        mapView.animate(toLocation: position)
        let marker = GMSMarker(position: position)
        marker.title = "Lat: \(lat) Lon: \(lon)"
//        marker.snippet = location
        marker.map = mapView
        print("update \(location) ")

    }
}
