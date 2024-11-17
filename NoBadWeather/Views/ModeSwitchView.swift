//
//  ModeSwitch.swift
//  NoBadWeather
//
//  Created by Stepan Konoplianko on 12.10.24.
//

import SwiftUI

struct ModeSwitchView: View {
    var body: some View {
        ZStack {
            Capsule()
                .overlay(
                    Capsule()
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 2))
                )
                .foregroundStyle(.indigo)
                .opacity(0.7)
                .frame(width: .infinity, height: 40)
            
            HStack {
                Capsule()
                    .frame(width: 80, height: 40, alignment: .leading)
                    .foregroundStyle(Color.indigo)
                    .opacity(0.8)
                Spacer()
            }
        }
        .frame(width: 140, height: 40)
        .padding()
    }
}

#Preview {
    ModeSwitchView()
}
