//
//  HTTPClient.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 31/7/2566 BE.
//

import Foundation
import Alamofire
import SwiftyJSON

class HTTPClient {
    
    static func requestWithParameter(url:String ,method: HTTPMethod,params: [String: Any]?, success: @escaping (_ value: AnyObject?, _ error: Error?)-> Void) {
        
        Alamofire.AF.request(URL(string: url)!, method: method , parameters: params).responseData() { (response) in
            switch response.result {
            case .success(let json):
                success(json as AnyObject, nil)
                break
            case .failure(let error):
                success(nil, error)
                break
            }
        }
    }
}
