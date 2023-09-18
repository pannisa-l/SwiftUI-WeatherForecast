//
//  TextStyles.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 28/8/2566 BE.
//

import SwiftUI

extension Text {
    static let screenUtil = ScreenUtil()
    
    //---------------------------------------------------//
    //Medium
    func textMediumGreen25() -> some View {
        self.foregroundColor(Color.green)
            .font(Font.custom("Kanit-Medium", size: Text.screenUtil.getFontSize(25)))
    }
    
    //---------------------------------------------------//
    //Light
    func textLightWhite14() -> some View {
        self.foregroundColor(Color.white)
            .font(Font.custom("Kanit-Light", size: Text.screenUtil.getFontSize(14)))
    }
    func textLightRed10() -> some View {
        self.foregroundColor(Color.red)
            .font(Font.custom("Kanit-Light", size: Text.screenUtil.getFontSize(10)))
    }
    func textLightBlack16() -> some View {
        self.foregroundColor(Color.black)
            .font(Font.custom("Kanit-Light", size: Text.screenUtil.getFontSize(16)))
    }
    
    
    //---------------------------------------------------//
    //Regular
    func textRegBlack16() -> some View {
        self.foregroundColor(Color.black)
            .font(Font.custom("Kanit-Regular", size: Text.screenUtil.getFontSize(16)))
    }
    
    func textRegBlack18() -> some View {
        self.foregroundColor(Color.black)
            .font(Font.custom("Kanit-Regular", size: Text.screenUtil.getFontSize(18)))
    }
    
    func textRegBlack20() -> some View {
        self.foregroundColor(Color.black)
            .font(Font.custom("Kanit-Regular", size: Text.screenUtil.getFontSize(20)))
    }
  
}
