//
//  NoBadWeatherTests.swift
//  NoBadWeatherTests
//
//  Created by Stepan Konoplianko on 09.10.24.
//

import Testing
import XCTest
@testable import NoBadWeather

struct NoBadWeatherTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    @Test
    func forecastIsNotAvalableTest() {
        let forecast = !fetchDictFromJSON().isEmpty ? fetchDictFromJSON() : nil
        XCTAssertNil(forecast, "[FAILED]: Forecast is not available.")
    }
    
    @Test
    func forecastIsAvalableTest() {
        let forecast = !fetchDictFromJSON().isEmpty ? fetchDictFromJSON() : nil
        XCTAssertNotNil(forecast, "[FAILED]: Forecast is not available.")
    }

    @Test
    func pickOutFitTest() {
        var forecast = !fetchDictFromJSON().isEmpty ? fetchDictFromJSON() : nil
        var outfit = pickOutfit(nil, forecast)
        
        for item in outfit {
            print(item.name)
        }
    }
}
