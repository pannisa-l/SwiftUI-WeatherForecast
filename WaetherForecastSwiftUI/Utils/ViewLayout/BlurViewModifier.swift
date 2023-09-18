//
//  BlurViewModifier.swift
//  WaetherForecastSwiftUI
//
//  Created by Pannisa Eem Lekphet on 8/9/2566 BE.
//

import Foundation
import SwiftUI

struct BlurViewModifier: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemThickMaterialLight
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
