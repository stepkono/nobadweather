//
//  HomePageView.swift
//  NoBadWeather
//
//  Created by Stepan Konoplianko on 27.10.24.
//

import SwiftUI

// ЕБАТЬ КОНЯ В ОЧКО 19.02.24

struct HomePageView: View {
    var body: some View {
        let outfit = getOutfit()
        let layers = outfit.count
        VStack {
            HStack {
                OutfitView(outfit: outfit)
                    .padding()
                Spacer()
                LayersView(layers: layers)
                    .scaleEffect(0.3)
                    .padding()
            }
        }
    }
}

func getOutfit() -> [ClothingItem] {
    let forecast = !fetchDictFromJSON().isEmpty ? fetchDictFromJSON() : nil
    let outfit = pickOutfit(nil, forecast)
    
    guard !outfit.isEmpty else {print("[ERROR]: An empty outfit was passed. Check assembleOutfit() or pickOutfit() for errors!"); return []}
    
    print("[INFO]: The generated outfit is:")
    for item in outfit {
        print(item.name)
    }
    return outfit
}

#Preview {
    HomePageView()
}
