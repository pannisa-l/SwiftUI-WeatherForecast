//
//  SplashScreenView.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 30/8/2566 BE.
//

import SwiftUI

struct SplashScreenView: View {
    @ObservedObject var viewModel = SplashScreenViewModel()
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                TabBarView(city: "New york",latitude: viewModel.latitude ,longitude: viewModel.longitude)
            } else {
                Image(systemName: "moon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .background(Color.white)
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    if viewModel.locationManager.authorizationStatus == "authorizedWhenInUse" {
                        viewModel.getLatLonLocation()
                    }
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
