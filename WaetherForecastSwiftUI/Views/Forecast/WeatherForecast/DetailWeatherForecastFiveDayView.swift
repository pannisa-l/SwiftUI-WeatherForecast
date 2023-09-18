//
//  DetailWeatherForecastFiveDayView.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 11/9/2566 BE.
//

import SwiftUI
import Kingfisher

struct DetailWeatherForecastFiveDayView: View {
    @Binding var fivedayForecast : [FivedayForecast]
    let indexList : Int
    @State var screenUtil = ScreenUtil()
    @State var rootoViewDetails : Bool = false
    
    var body: some View {
        NavigationStack {
            VStack{
                VStack(alignment: .center){
                    
                    Text("\(self.fivedayForecast[indexList].day ?? "")").textRegBlack20()
                        .padding()
                    
                    Text("Temperature \(Int((fivedayForecast[indexList].weatherData[0].temp ?? 0) - 273.15))°")
                        .textRegBlack18()
                        .padding()
                    
                    Text("\(fivedayForecast[indexList].weatherData[0].description ?? "")")
//                        .padding()
                    
                    Text("Minimum forecast temperature \(Int((fivedayForecast[indexList].weatherData[0].temp_min ?? 0) - 273.15))°")
                        .textRegBlack16()
                        .padding()
                    
                    Text("Maximum forecast temperature \(Int((fivedayForecast[indexList].weatherData[0].temp_max ?? 0) - 273.15))°")
                        .textRegBlack16()
                        .padding()
                    
                    KFImage(URL(string: "https://openweathermap.org/img/wn/\(fivedayForecast[indexList].weatherData[0].icon ?? "")@4x.png"))
                        .placeholder {
                            Circle()
                                .fill(Color.white)
                        }.resizable()
                        .frame(width: screenUtil.getWidth(80), height: screenUtil.getWidth(80))
//                                .skeleton(with: typesOfAPI == .loading)
//                                .frame(width: screenUtil.getWidth(80), height: screenUtil.getWidth(80))
                        .padding(.top,screenUtil.getHeight(8))
                    
                    NavigationLink(destination: DetailInForecastFiveDayView(fivedayForecast: fivedayForecast[indexList],indexList: indexList),
                                   isActive: $rootoViewDetails) {
                        Button {
                            rootoViewDetails = true
                            print("indexList \(indexList)")
                        } label: {
                            Text("View Deatils in \(self.fivedayForecast[indexList].day ?? "")").textLightWhite14()
                        }.frame(width: screenUtil.getWidth(200),height: screenUtil.getHeight(30),alignment: .center)
                            .background(.gray)
                            .cornerRadius(10)
                            .padding()
                    }
                }
                
            }.frame(minWidth: 0,maxWidth: .infinity, minHeight: 0,maxHeight: .infinity,alignment: .center)
                .background(.yellow)
        }
    }
}
