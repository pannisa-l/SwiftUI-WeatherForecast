//
//  ExtensionInt.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 7/8/2566 BE.
//

import Foundation

extension Int {
    func incrementWeekDays(by num: Int) -> Int {
        let incrementedVal = self + num
        let mod = incrementedVal % 7

        return mod
    }
}
