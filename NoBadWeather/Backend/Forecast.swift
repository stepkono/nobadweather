//
//  Forecast.swift
//  NoBadWeather
//
//  Created by Stepan Konoplianko on 12.10.24.
//

import Foundation

struct Forecast: Codable {
    struct Current: Codable {
        let dt: Date
        let temp: Double
        let feelsLike: Double
        let clouds: Int
        let wind_speed: Double
        let wind_deg: Double
        let wind_gust: Double
        struct Weather: Codable {
            let id: Int
            let main: String
            let description: String
        }
        let weather: [Weather]
    }
    let current: Current
    struct Daily: Codable {
        let dt: Date
        struct Temp: Codable {
            let day: Double
            let min: Double
            let max: Double
            let night: Double
            let eve: Double
            let morn: Double
        }
        let temp: [Temp]
        struct feelsLike: Codable {
            let day: Double
            let night: Double
            let eve: Double
            let morn: Double
        }
        let feelsLike: [feelsLike]
        let humdity: Double
        let windSpeed: Double
        //let windDeg: Double
        struct Weather: Codable {
            let id: Int
            let main: String
            let description: String
        }
        let weather: [Weather]
        let clouds: Int
        let pop: Double
        let rain: Double?
        let snow: Double?
    }
    let daily: [Daily]
}
