//
//  3DOutfitView.swift
//  NoBadWeather
//
//  Created by Stepan Konoplianko on 19.10.24.
//

import SwiftUI
import SceneKit

struct OutfitView: View {
    //var forecast = getForecast()
    //var forecast = !fetchDictFromJSON().isEmpty ? fetchDictFromJSON() : nil
    //let forecast = !fetchDictFromJSON().isEmpty ? fetchDictFromJSON() : nil
    let outfit: [ClothingItem]
    var body: some View {
        VStack {
            if !outfit.isEmpty {
                ForEach(outfit.indices, id: \.self) { index in
                    if index == 3 {
                        SceneView(scene: SCNScene(named: "BlackJacket.usdc"), options: [.autoenablesDefaultLighting, .jitteringEnabled, .allowsCameraControl])
                            .frame(width: 400, height: 600)
                    }
                    Text(outfit[index].name)
                }
            }
            else {
                Text("No outfit could be assembled.")
            }
        }
    }
}

#Preview {
    OutfitView(outfit: getOutfit())
}

