//
//  TextFieldClearButton.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 15/8/2566 BE.
//

import Foundation
import SwiftUI


struct TextFieldClearButton: ViewModifier {
    @Binding var fieldText: String
    @Binding var txtNotCorrect: Bool
    @ObservedObject var splashScreenViewModel = SplashScreenViewModel()
    @ObservedObject var currenviewModel = CurrentWaetherViewModel()
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if !fieldText.isEmpty {
                    HStack {
                        Spacer()
                        Button {
                            fieldText = ""
                            txtNotCorrect = false
                            UserDefaults.standard.removeObject(forKey: "Location")
                            UserDefaults.standard.synchronize()
                        } label: {
                            Image(systemName: "multiply.circle.fill")
                        }
                        .foregroundColor(.secondary)
                        .padding(.trailing, 4)
                    }
                }
            }
    }
}

extension View {
    func showClearButton(_ text: Binding<String>,_ txtNotCorrect: Binding<Bool>) -> some View {
        self.modifier(TextFieldClearButton(fieldText: text, txtNotCorrect: txtNotCorrect))
    }
}
