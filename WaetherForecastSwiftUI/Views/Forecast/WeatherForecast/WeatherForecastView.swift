//
//  WeatherForecastView.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 1/8/2566 BE.
//

import SwiftUI
import Kingfisher

struct WeatherForecastFiveDayView: View {
    @ObservedObject var viewModel = WeatherForecastViewModel()
    @ObservedObject var splashScreenViewModel = SplashScreenViewModel()
    
    @State var screenUtil = ScreenUtil()
    @State var rootoViewDetails : Bool = false
    
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemYellow
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                TabView(){
                    ForEach(0..<viewModel.fivedayForecast.count, id:\.self) { index in
                        DetailWeatherForecastFiveDayView(fivedayForecast: $viewModel.fivedayForecast,indexList: index)
                            .frame(width: screenUtil.getWidth(350),height: screenUtil.getHeight(550),alignment: .top)
                    }
                    .cornerRadius(10)
                    .padding(.bottom,screenUtil.getHeight(50))
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }.navigationBarTitle(splashScreenViewModel.location != "" ? splashScreenViewModel.location : " ", displayMode: .inline)
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 1)
        }.onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                self.splashScreenViewModel.getDefaultLocationCity()
                self.viewModel.getCurrentWeatherForecast(location: splashScreenViewModel.location)
            })
        }).toolbar(.automatic, for: .tabBar)
    }
}

struct WeatherForecastFiveDayView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecastFiveDayView()
    }
}
