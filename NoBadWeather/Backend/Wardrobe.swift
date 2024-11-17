//
//  Wardrobe.swift
//  NoBadWeather
//
//  Created by Stepan Konoplianko on 27.10.24.
//

import Foundation

struct ClothingItem {
    let name: String
    let categoryIndex: Int
    let minLayer: Int
    let isWaterResistant: Bool
    let isWindResistant: Bool
    var probability: Double
}

let clothingItems: [String: [ClothingItem]] = [
    "Jackets": [
        ClothingItem(name: "Winter Jacket", categoryIndex: 6, minLayer: 2, isWaterResistant: true, isWindResistant: true, probability: 0.0),
        ClothingItem(name: "Light Jacket", categoryIndex: 2, minLayer: 2, isWaterResistant: true, isWindResistant: true, probability: 0.0),
        ClothingItem(name: "Coat", categoryIndex: 5, minLayer: 2, isWaterResistant: false, isWindResistant: false, probability: 0.0),
        ClothingItem(name: "Fall Jacket", categoryIndex: 2, minLayer: 3, isWaterResistant: false, isWindResistant: true, probability: 0.0)
    ],
    "Topwear": [
        ClothingItem(name: "Sweater", categoryIndex: 3, minLayer: 2, isWaterResistant: false, isWindResistant: false, probability: 0.0),
        ClothingItem(name: "Pullover", categoryIndex: 2, minLayer:  2, isWaterResistant: false, isWindResistant: false, probability: 0.0),
        ClothingItem(name: "Longsleeve Shirt", categoryIndex: 3, minLayer: 2, isWaterResistant: false, isWindResistant: false, probability: 0.0)
    ],
    "Underwear": [
        ClothingItem(name: "T-Shirt", categoryIndex: 0, minLayer: 1, isWaterResistant: false, isWindResistant: false, probability: 0.0),
        ClothingItem(name: "Thermowear", categoryIndex: 3, minLayer: 1, isWaterResistant: false, isWindResistant: false, probability: 0.0),
        ClothingItem(name: "Tanktop", categoryIndex: 0, minLayer: 1, isWaterResistant: false, isWindResistant: false, probability: 0.0)
    ],
    "Pants": [
        ClothingItem(name: "Normal Pants", categoryIndex: 2, minLayer: 5, isWaterResistant: false, isWindResistant: false, probability: 0.0),
        ClothingItem(name: "Jeans", categoryIndex: 2, minLayer: 5, isWaterResistant: false, isWindResistant: false, probability: 0.0),
        ClothingItem(name: "Winter Pants", categoryIndex: 0, minLayer: 5, isWaterResistant: true, isWindResistant: true, probability: 0.0),
        ClothingItem(name: "Shorts", categoryIndex: 1, minLayer: 5, isWaterResistant: false, isWindResistant: false, probability: 0.0)
    ],
    "Accessories": [
        ClothingItem(name: "Umbrella", categoryIndex: 0, minLayer: 0, isWaterResistant: true, isWindResistant: false, probability: 0)
    ]
]

let readyOutfits: [Int: [ClothingItem]] = [
    //The following are clothes categorized by fitting temperatures
    //26-40
    1: [
        clothingItems["Underwear"]!.first(where: {$0.name == "Tanktop"})!,
        clothingItems["Pants"]!.first(where: {$0.name == "Shorts"})!
       ],
    2: [
        clothingItems["Underwear"]!.first(where: {$0.name == "T-Shirt"})!,
        clothingItems["Pants"]!.first(where: {$0.name == "Shorts"})!
    ],
    //19-25
    3: [
        clothingItems["Underwear"]!.first(where: {$0.name == "T-Shirt"})!,
        clothingItems["Pants"]!.first(where: {$0.name == "Jeans"})!
    ],
    4: [
        clothingItems["Underwear"]!.first(where: {$0.name == "T-Shirt"})!,
        clothingItems["Topwear"]!.first(where: {$0.name == "Pullover"})!,
        clothingItems["Pants"]!.first(where: {$0.name == "Jeans"})!
    ],
    5: [
        clothingItems["Underwear"]!.first(where: {$0.name == "T-Shirt"})!,
        clothingItems["Topwear"]!.first(where: {$0.name == "Sweater"})!,
        clothingItems["Pants"]!.first(where: {$0.name == "Jeans"})!
    ],
    6: [
        clothingItems["Underwear"]!.first(where: {$0.name == "T-Shirt"})!,
        clothingItems["Topwear"]!.first(where: {$0.name == "Pullover"})!,
        clothingItems["Pants"]!.first(where: {$0.name == "Jeans"})!,
        clothingItems["Jackets"]!.first(where: {$0.name == "Fall Jacket"})!
    ],
    7: [
        clothingItems["Underwear"]!.first(where: {$0.name == "T-Shirt"})!,
        clothingItems["Topwear"]!.first(where: {$0.name == "Pullover"})!,
        clothingItems["Pants"]!.first(where: {$0.name == "Jeans"})!,
        clothingItems["Jackets"]!.first(where: {$0.name == "Coat"})!
    ],
    8: [
        clothingItems["Underwear"]!.first(where: {$0.name == "T-Shirt"})!,
        clothingItems["Topwear"]!.first(where: {$0.name == "Sweater"})!,
        clothingItems["Pants"]!.first(where: {$0.name == "Jeans"})!,
        clothingItems["Jackets"]!.first(where: {$0.name == "Winter Jacket"})!
    ],
    9: [
        clothingItems["Underwear"]!.first(where: {$0.name == "Thermowear"})!,
        clothingItems["Topwear"]!.first(where: {$0.name == "Pullover"})!,
        clothingItems["Pants"]!.first(where: {$0.name == "Jeans"})!,
        clothingItems["Jackets"]!.first(where: {$0.name == "Winter Jacket"})!
    ],
    10: [
        clothingItems["Underwear"]!.first(where: {$0.name == "Thermowear"})!,
        clothingItems["Topwear"]!.first(where: {$0.name == "Pullover"})!,
        clothingItems["Pants"]!.first(where: {$0.name == "Winter Pants"})!,
        clothingItems["Jackets"]!.first(where: {$0.name == "Winter Jacket"})!
    ]
]
