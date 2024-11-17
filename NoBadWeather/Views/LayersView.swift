//
//  LayersView.swift
//  NoBadWeather
//
//  Created by Stepan Konoplianko on 27.10.24.
//

import SwiftUI

struct LayersView: View {
    let layers: Int
    var body: some View {
        VStack {
            ForEach(0..<layers, id: \.self) { index in
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .opacity(0.3)
                            .frame(width: 100, height: 100)
                            .rotationEffect(.degrees(45))
                            .overlay {
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(lineWidth: 3)
                                    .opacity(0.7)
                                    .scaleEffect(0.8)
                                    .rotationEffect(.degrees(45))
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(style: StrokeStyle(lineWidth: 3))
                                    .opacity(0.5)
                                    .rotationEffect(.degrees(45))
                            }
                        Text("\(index + 1)")
                            .font(.title)
                    }
                    .padding()
                    if layers > 1 && index < layers - 1{
                        DottedLineView()
                    }
                }
            }
        }
    }
}

struct DottedLineView: View {
    var body: some View {
        ForEach(0..<5) { _ in
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 4)
                .opacity(0.5)
        }
    }
}

#Preview {
    LayersView(layers: 3)
}
