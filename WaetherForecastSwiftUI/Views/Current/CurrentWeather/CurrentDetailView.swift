//
//  CurrentDetailUIView.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 28/8/2566 BE.
//

import SwiftUI
import SkeletonUI
import Kingfisher

struct CurrentDetailView: View {
    
    @ObservedObject var splashScreenViewModel = SplashScreenViewModel()
    
    @Binding var displayWeatherItem : DisplayWeatherItem
    var typesOfAPI : TypesOfAPI = .loading
    var offset : CGFloat
    var urlImg = URL(string: "")
    var value : CGFloat
    
    @State var screenUtil = ScreenUtil()
    
    var body: some View {
        VStack{
            VStack{
                    Capsule().fill(Color.gray.opacity(0.5))
                        .frame(width: screenUtil.getHeight(50), height: screenUtil.getHeight(5), alignment: .center)
                        .padding(.top,screenUtil.getHeight(10))
                        .padding(.bottom,screenUtil.getHeight(5))

                    VStack{
                        Text("\(displayWeatherItem.cityName ?? "")").textMediumGreen25()
                            
//                            .skeleton(with: true)
//                            .shape(type: .rectangle)
//                            .multiline(lines: 1, scales: [1: 1], spacing: 0)

                        Text("\(displayWeatherItem.temp ?? 0) °C").textRegBlack20()
                            .padding(.top,screenUtil.getHeight(3))
                        Text("\(displayWeatherItem.description ?? "clear sky")").textRegBlack20()
                            .padding(.top,screenUtil.getHeight(3))
                        HStack{
                            Text("Sunrise : \(displayWeatherItem.sunrise ?? "")").textRegBlack20()
                            Text("Sunset : \(displayWeatherItem.sunset ?? "")").textRegBlack20().padding(.leading,screenUtil.getWidth(5))
                        }.padding(.top,screenUtil.getHeight(3))
                        
                            KFImage(urlImg)
                                .placeholder {
                                    Circle()
                                        .fill(Color.white)
                                }.resizable()
                                .frame(width: screenUtil.getWidth(80), height: screenUtil.getWidth(80))
//                                .skeleton(with: typesOfAPI == .loading)
//                                .frame(width: screenUtil.getWidth(80), height: screenUtil.getWidth(80))
                                .padding(.top,screenUtil.getHeight(8))
                }
                Spacer()
            }.frame(maxWidth: .infinity,maxHeight: .infinity)
        }.onTapGesture {
            withAnimation{
                //offset = value
            }
        }
        .background(Color.white)
        .cornerRadius(5)
    }
}

struct CurrentDetailView_Previews: PreviewProvider {
    @State static var displayWeatherItem = DisplayWeatherItem(cityName: "San Frasico", main: "zzzzzz", description: "zzzzzz", icon: "", humidity: "zzzzzz", temp_max: 10, temp_min: 10, feels_like: 10, sunrise: "", sunset: "", pressure: 10, temp: 30, lon: 0.0, lat: 0.0)
    @State static var cityInput = "San Francisco"
    @State static var value = 0
    @State static var float = 0.0
    
    static var previews: some View {
        CurrentDetailView(displayWeatherItem: $displayWeatherItem, offset: CGFloat(value), value: CGFloat(value))
    }
}
