//
//  NetworkManager.swift
//  NoBadWeather
//
//  Created by Stepan Konoplianko on 12.10.24.
//

import Foundation

func getForecast(_ apiKey: String, _ lat: Double, _ lon: Double, _ part: [String]) async throws -> Forecast {
    let apiURLString = "https://api.openweathermap.org/data/3.0/onecall?lat={\(lat)}&lon={\(lon)}&exclude={\(part)}&appid={\(apiKey)}"
    
    guard let apiURL = URL(string: apiURLString) else {
        throw OWErrors.invalidURL
    }
    
    let (data, responce) = try await URLSession.shared.data(from: apiURL)
    //Makes sure the responce from server is everything's fine
    guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else {
        throw OWErrors.invalidResponce(statusCode: (responce as? HTTPURLResponse)?.statusCode ?? -1)
    }
   
    do {
        let decoder = JSONDecoder()
        //Convert everything to Camel Case
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let forecast = try decoder.decode(Forecast.self, from: data)
        return forecast
    } catch {
        throw OWErrors.invalidData
    }
}

func fetchDictFromJSON() -> [String: Any] {
    print("[INFO]: start fetching data...")
    do {
        if let url = Bundle.main.url(forResource: "WeatherData", withExtension: "json") {
            let data = try Data(contentsOf: url)
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            let jsonDictionary = jsonObject as! [String: Any]
            print("[INFO]: data fetched successfully.\n")
            return jsonDictionary
        } else {
            print("[ERROR]: url for the file not found.")
            return [:]
        }
    } catch {
        //throw error
        print("[ERROR]: Error initializing JSON from file: \(error)")
        return [:]
    }
}
