//
//  OutfitManager.swift
//  NoBadWeather
//
//  Created by Stepan Konoplianko on 17.10.24.
//

import Foundation

func assembleOutfit(outfitCode code: Int, _ forecast: Forecast?, _ jsonForecast: [String: Any]) -> [ClothingItem] {
    
    //let rainAmount = forecast.daily[0].rain
    let rainAmount = jsonForecast["rain"] as? Double ?? nil
    let rain = rainAmount != nil && rainAmount! > 0
    var layersCount: Int = 0
    var outfit: [ClothingItem] = []
    var accessories: [ClothingItem] = []
    
    switch code {
    case 1...3: layersCount = 1
    case 4...5: layersCount = 2
    case 6...10: layersCount = 3
    default:
        print("[WARNING]: No outfit for code \(code).")
        break
    }
    
    for i in 0..<layersCount {
        outfit.append(readyOutfits[code]!.first(where: {$0.minLayer == i+1})!)
    }
    
    if rain {
        switch code {
        case 1...5:
            if let rainJacket = clothingItems["Jackets"]?.first (where: {$0.isWaterResistant && $0.categoryIndex == 2}) {
                outfit.append(rainJacket)
            }
            //rainAmount can't be nil here. No way.
            if (rainAmount! > 10) {
                if let umbrella = clothingItems["Accessories"]?.first(where: {$0.name == "Umnrella"}) {
                    accessories.append(umbrella)
                }
            }
        case 6...10 where rainAmount! > 10: accessories.append(clothingItems["Accessories"]!.first(where: {$0.name == "Umbrella"})!)
        default:
            print("[WARNING]: Default status of rain?{} closure.")
            break
        }
    }
    
    let pants = readyOutfits[code]!.first(where: {$0.minLayer == 5})!
    outfit.append(pants)
    return outfit
}

func pickOutfit(_ forecast: Forecast?, _ jsonForecast: [String: Any]?) -> [ClothingItem] {
    //let current = jsonForecast["current"]
    
    //Check if json forecast is available, if not, abort mission.
    guard let jsonForecast = jsonForecast else {print("[ERROR]: No jsonForecast could be extracted."); return []}
    let temp = forecast?.current.temp ?? ((jsonForecast["current"] as? [String : Any])? ["temp"] as? Double ?? nil)
    
    //Check if temperature could be extracted, if not, abort mission.
    guard temp != nil else {print("[ERROR]: No current temperature could be extracted."); return []}
    print("[INFO]: current temp is: \(temp!)\n")
    //let currentFeelsLikeTemp = forecast.current.feelsLike
    
    switch temp! {
    case -10 ..< -7:
        return assembleOutfit(outfitCode: 9, nil, jsonForecast)
    case -7..<5:
        return assembleOutfit(outfitCode: 8, nil, jsonForecast)
    case 5..<8:
        return assembleOutfit(outfitCode: 7, nil, jsonForecast)
    case 8..<15:
        return assembleOutfit(outfitCode: 6, nil, jsonForecast)
    case 15..<17:
        return assembleOutfit(outfitCode: 5, nil, jsonForecast)
    case 17..<20:
        return assembleOutfit(outfitCode: 4, nil, jsonForecast)
    case 20..<25:
        return assembleOutfit(outfitCode: 3, nil, jsonForecast)
    case 25..<30:
        return assembleOutfit(outfitCode: 2, nil, jsonForecast)
    case 30..<65:
        return assembleOutfit(outfitCode: 1, nil, jsonForecast)
    default:
        print("[ERROR]: no outfit could be assembled. Passing empty array.")
        return []
    }
}
