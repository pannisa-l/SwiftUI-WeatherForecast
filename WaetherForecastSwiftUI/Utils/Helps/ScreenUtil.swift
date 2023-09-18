//
//  ScreenUtil.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 28/8/2566 BE.
//

import UIKit

class ScreenUtil {
    
    static let deviceWidth = UIScreen.main.bounds.width
    static let deviceHeight = UIScreen.main.bounds.height
    
    var designWidth:CGFloat = 390
    var designHeight:CGFloat = 844
    
    private var scaleWidth:CGFloat{
        get{
            return ScreenUtil.deviceWidth / designWidth
        }
    }
    
    private var scaleHeight:CGFloat{
        get{
            return ScreenUtil.deviceHeight / designHeight
        }
    }
    
    init(){
        
    }
    
    init(designWidth:CGFloat, designHeight:CGFloat){
        self.designWidth = designWidth
        self.designHeight = designHeight
    }
    
}

extension ScreenUtil{
    func getWidth(_ value:CGFloat) -> CGFloat{
        return (ScreenUtil.deviceWidth * value) / designWidth
    }
    
    func getHeight(_ value:CGFloat) -> CGFloat{
        return (ScreenUtil.deviceHeight  * value) / designHeight
    }
    
    func getFontSize(_ value:CGFloat) -> CGFloat{
        let ratio = min(scaleWidth, scaleHeight)
        return value * ratio
    }
}
