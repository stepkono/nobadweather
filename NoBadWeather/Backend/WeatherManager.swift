//
//  WeatherManager.swift
//  NoBadWeather
//
//  Created by Stepan Konoplianko on 11.10.24.
//

/*
import Foundation

struct ClothingItem {
    let name: String
    let categoryIndex: Int
    let minLayer: Int?
    let isWaterResistant: Bool
    let isWindResistant: Bool
    let probability: Double
}

var outfit: [ClothingItem] = []

let clothingItemsSet: [String: [ClothingItem]] = [
    "Jackets": [
        ClothingItem(name: "Winter Jacket", categoryIndex: 6, minLayer: 2, isWaterResistant: true, isWindResistant: true, probability: 0.0),
        ClothingItem(name: "Spring Jacket", categoryIndex: 4, minLayer: 2, isWaterResistant: false, isWindResistant: true, probability: 0.0),
        ClothingItem(name: "Coat", categoryIndex: 5, minLayer: 2, isWaterResistant: false, isWindResistant: false, probability: 0.0),
        ClothingItem(name: "Summer Jacket", categoryIndex: 3, minLayer: 2, isWaterResistant: false, isWindResistant: true, probability: 0.0)
    ],
    "Overwear": [
        ClothingItem(name: "Sweater", categoryIndex: 3, minLayer: 2, isWaterResistant: false, isWindResistant: false, probability: 0.0),
        ClothingItem(name: "Pullover", categoryIndex: 2, minLayer:  2, isWaterResistant: false, isWindResistant: false, probability: 0.0),
        ClothingItem(name: "Longsleeve Shirt", categoryIndex: 3, minLayer: 2, isWaterResistant: false, isWindResistant: false, probability: 0.0)
    ],
    "Underwear": [
        ClothingItem(name: "T-Shirt", categoryIndex: 0, minLayer: 0, isWaterResistant: false, isWindResistant: false, probability: 0.0),
        ClothingItem(name: "Thermowear", categoryIndex: 3, minLayer: 0, isWaterResistant: false, isWindResistant: false, probability: 0.0),
        ClothingItem(name: "Tanktop", categoryIndex: 0, minLayer: 0, isWaterResistant: false, isWindResistant: false, probability: 0.0)
    ],
    "Pants": [
        ClothingItem(name: "Normal Pants", categoryIndex: 2, minLayer: 0, isWaterResistant: false, isWindResistant: false, probability: 0.0),
        ClothingItem(name: "Jeans", categoryIndex: 2, minLayer: 0, isWaterResistant: false, isWindResistant: false, probability: 0.0),
        ClothingItem(name: "WinterPants", categoryIndex: 0, minLayer: 0, isWaterResistant: true, isWindResistant: true, probability: 0.0),
        ClothingItem(name: "Shorts", categoryIndex: 1, minLayer: 0, isWaterResistant: false, isWindResistant: false, probability: 0.0)
    ],
    "Accessories": [
        ClothingItem(name: "Scarf", categoryIndex: 2, minLayer: nil, isWaterResistant: false, isWindResistant: true, probability: 0.0),
        ClothingItem(name: "Beanie", categoryIndex: 2, minLayer: nil, isWaterResistant: false, isWindResistant: true, probability: 0.0),
        ClothingItem(name: "Gloves", categoryIndex: 2, minLayer: nil, isWaterResistant: false, isWindResistant: true, probability: 0.0),
        ClothingItem(name: "Sunglasses", categoryIndex: 0, minLayer: nil, isWaterResistant: false, isWindResistant: false, probability: 0.0),
        ClothingItem(name: "Basecap", categoryIndex: 0, minLayer: nil, isWaterResistant: false, isWindResistant: false, probability: 0.0)
    ]
]

let outfitCategories: [Int: [ClothingItem]] = [
    //The following are clothes categorized by fitting temperatures
    //26-40
    1: [clothingItemsSet["Underwear"]!.first(where: {$0.name == "T-Shirt"})!,
        clothingItemsSet["Underwear"]!.first(where: {$0.name == "Tanktop"})!,
        clothingItemsSet["Accessories"]!.first(where: {$0.name == "Basecap"})!,
        clothingItemsSet["Pants"]!.first(where: {$0.name == "Shorts"})!
       ],
    //19-25
    2: [clothingItemsSet["Underwear"]!.first(where: {$0.name == "T-Shirt"})!,
        clothingItemsSet["Overwear"]!.first(where: {$0.name == "Longsleeve Shirt"})!,
        clothingItemsSet["Pants"]!.first(where: {$0.name == "Normal Pants"})!,
        clothingItemsSet["Pants"]!.first(where: {$0.name == "Jeans"})!,
        clothingItemsSet["Pants"]!.first(where: {$0.name == "Shorts"})!,
        clothingItemsSet["Jackets"]!.first(where: {$0.name == "Summer Jacket"})!
       ],
    //0-18
    3: [clothingItemsSet["Underwear"]!.first(where: {$0.name == "T-Shirt"})!,
        clothingItemsSet["Overwear"]!.first(where: {$0.name == "Sweater"})!,
        clothingItemsSet["Overwear"]!.first(where: {$0.name == "Pullover"})!,
        clothingItemsSet["Jackets"]!.first(where: {$0.name == "Spring Jacket"})!,
        clothingItemsSet["Jackets"]!.first(where: {$0.name == "Coat"})!,
        clothingItemsSet["Pants"]!.first(where: {$0.name == "Normal Pants"})!,
        clothingItemsSet["Pants"]!.first(where: {$0.name == "Jeans"})!,
        clothingItemsSet["Accessories"]!.first(where: {$0.name == "Scarf"})!
       ],
    5: [
        clothingItemsSet["Underwear"]!.first(where: {$0.name == "T-Shirt"})!,
    ]
]

func assembleOutfit(forecast: Forecast) async throws -> [ClothingItem] {
    let forecast = try await getForecast("ben", 0.6, 1.0, ["Ben"])
    //var clothingItems = clothingItemsSet
    
    //let temperature = forecast.daily.first?.temp.first?.day
    //TODO: we have to count in the future forecast
    if let firstDay = forecast.daily.first {
        let temperature = firstDay.temp.first?.day
        let temperatureMin = firstDay.temp.first?.min
        let temperatureMax = firstDay.temp.first?.max
        let humidity = firstDay.humdity
        let windSpeed = firstDay.windSpeed
        //let windDegree = firstDay.windDeg
        let cloudiness = firstDay.clouds
        let rain = firstDay.rain
        let snow = firstDay.snow
        
        //TODO: make sure temperature is always accessable
        switch temperature! {
        case 0..<5:
            print("Ben")
        case 5..<8:
            print("Ben")
        case 8..<15:
            print("Ben")
        case 15..<20:
            print("Ben")
        case 20..<25:
            print("Ben")
        case 25..<30:
            print("Ben")
        case 30..<35:
            print("Ben")
        case 35..<40:
            print("Ben")
        case 45..<50:
            print("Ben")
        case 50...55:
            print("Check")
        default: print("Ben")
        }
        
        switch rain! {
        case 0:
            print("No rain")
        case 0.01..<2:
            print("Light Rain")
        case 2..<10:
            print("Moderate Rain")
        case 10..<30:
            print("Heavy Rain")
        case 30..<50:
            print("Very heavy rain")
        default:
            print("Rainfall")
        }
        
        switch windSpeed {
        case 0..<1:
            print("Ben")
        case 1...5:
            print("Light Air")
        case 6...11:
            print("Light Breeze, feld on face")
        case 12...19:
            print("Gentle Breeze")
        case 20...28:
            print("Moderate Breeze")
        case 29...38:
            print("Fresh Breeze")
        case 38...49:
            print("Strong Breeze")
        case 50...61:
            print("Near Gale")
        case 62...74:
            print("Gale")
        case 75...88:
            print("Storm")
        case 103...117:
            print("Violnt Storm")
        case 118:
            print("Hurricane")
        default: print("Hurricane")
        }
    }
    
    else {
        throw NSError(domain: "No data is included for the first item.", code: 0)
    }
    
    return outfit
}
*/
