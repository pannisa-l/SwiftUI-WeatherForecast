//
//  CurrentWeatherView.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 31/7/2566 BE.
//

import SwiftUI
import SkeletonUI
import GoogleMaps
import MapKit
import CoreLocation

struct CurrentWeatherView: View {
    @ObservedObject var viewModel = CurrentWaetherViewModel()
    @ObservedObject var splashScreenViewModel = SplashScreenViewModel()
    @ObservedObject var locationManager = LocationManager()
    
    @State var screenUtil = ScreenUtil()
    @State var cityInput: String = ""
    @State var txtNotCorrect: Bool = false
    @State var offset : CGFloat = 0
    
    
    var city: String // From TabBarView
    var latitude: Double = 0.0 // From TabBarView
    var longtitude: Double = 0.0 // From TabBarView
    var value : CGFloat = 0
    let pub = NotificationCenter.default.publisher(for: NSNotification.Name("statusLocationChange"))

    
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    TextField(titleKey: "Enter your City", text: $cityInput
                              ,onCommit: {
                        let pattern = "[a-zA-Z]"
                        let result = cityInput.range(of: pattern, options:.regularExpression)
                        if result != nil {
                            txtNotCorrect = false
                            viewModel.getCurrentWeather(city: cityInput)
                        }else{
                            txtNotCorrect = true
                        }
                    })
                    .modifier(TextFieldClearButton(fieldText: $cityInput,txtNotCorrect: $txtNotCorrect))
                    .padding([.top,.leading,.trailing])
                    //.padding(.bottom,10)
                    .textFieldStyle(.roundedBorder)
                    .foregroundColor(Color.green)
                    
                    VStack{
                        Text(self.txtNotCorrect ? "Only English language" : "")
                            .textLightRed10()
                    }
                    
                    VStack{
                        MapView(latitude: viewModel.loadingViewMap ? viewModel.displayWeatherItem.lat : 0.0 ,
                                longtitude: viewModel.loadingViewMap ? viewModel.displayWeatherItem.lon : 0.0,
                                location: viewModel.loadingViewMap ? viewModel.displayWeatherItem.cityName ?? "" : city)
                    }
                }
                
                GeometryReader{ reader in
                    VStack{
                        CurrentDetailView(displayWeatherItem: $viewModel.displayWeatherItem,typesOfAPI: viewModel.typesOfAPI,offset: offset,urlImg: viewModel.urlImg, value: (-reader.frame(in: .global).height + screenUtil.designHeight)).offset(y: reader.frame(in: .global).height - screenUtil.getHeight(150))
                            .offset(y: offset)
                            .gesture(DragGesture().onChanged({ (value) in
                                withAnimation{
                                    if value.startLocation.y > reader.frame(in: .global).minX{
                                        if value.translation.height < 0 && offset > (-reader.frame(in: .global).height + screenUtil.getHeight(500)){
                                            offset = value.translation.height
                                        }
                                    }
                                    if value.startLocation.y < reader.frame(in: .global).minX{
                                        if value.translation.height > 0 && offset < 0 {
                                            offset = (-reader.frame(in: .global).height + screenUtil.getHeight(500)) +  value.translation.height
                                        }
                                    }
                                }
                            }).onEnded({ (value) in
                                withAnimation{
                                    if value.startLocation.y > reader.frame(in: .global).minX{
                                        if -value.translation.height > reader.frame(in: .global).minX{
                                            offset = (-reader.frame(in: .global).height + screenUtil.getHeight(500))
                                            return
                                        }
                                        offset = 0
                                    }
                                    if value.startLocation.y < reader.frame(in: .global).minX{
                                        if value.translation.height < reader.frame(in: .global).minX{
                                            offset = (-reader.frame(in: .global).height + screenUtil.getHeight(500))
                                            return
                                        }
                                        offset = 0
                                    }
                                }
                            }))
                    }
                }
                
                if viewModel.alertForNotFoundData {

//                    print("Alert \(alertNotFound)")
                    GeometryReader{ _ in
//                        proxy in BlurView(style: .light)
                    }
                    .alert(isPresented: $viewModel.alertForNotFoundData) {
                        Alert(title: Text("No data found."), message: .none, dismissButton: .default(Text("OK")))
                    }
                    .background(BlurViewModifier())
                }
                
            }.navigationBarTitle(viewModel.displayWeatherItem.cityName == "" ? city : viewModel.displayWeatherItem.cityName ?? "\(city)", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.cityInput = ""
                        self.splashScreenViewModel.getLatLonLocation()
                        self.viewModel.getCurrentWeatherBylatlon(lat: self.splashScreenViewModel.latitude, lon: self.splashScreenViewModel.longitude)
                    } label: {
                        Image(systemName: "paperplane")
                            .foregroundColor(Color.green)
                    }
                }
            }.onAppear(perform: {
                self.splashScreenViewModel.getDefaultLocationCity()
                if splashScreenViewModel.location != "" {
                    viewModel.getCurrentWeather(city: splashScreenViewModel.location)
                }else if self.latitude != 0.0 && self.longtitude != 0.0 {
                    self.splashScreenViewModel.getLatLonLocation()
                    self.viewModel.getCurrentWeatherBylatlon(lat: self.splashScreenViewModel.latitude, lon: self.splashScreenViewModel.longitude)
                }else{
                    viewModel.getCurrentWeather(city: city)
                }
            })
            .onReceive(self.locationManager.$authorizationStatus) { value in
                if value == "authorizedWhenInUse" {
                    statusLocationChange()
                }
            }
            
        }
    }
    
    func statusLocationChange(){
        self.splashScreenViewModel.getLatLonLocation()
        self.viewModel.getCurrentWeatherBylatlon(lat: self.splashScreenViewModel.latitude, lon: self.splashScreenViewModel.longitude)
    }
}



struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(city: "Newyork")
    }
}
