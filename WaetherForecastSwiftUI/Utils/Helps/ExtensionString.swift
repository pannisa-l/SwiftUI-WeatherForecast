//
//  ExtensionString.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 16/8/2566 BE.
//

import Foundation


extension String {
    
    var isENText: Bool {
        return self.range(
            of: "ABBCDEFGHIJKLMNOPQRSTUVWXYZ", // 1
            options: .regularExpression) != nil
    }
    
}
extension NSRegularExpression {
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }
}
