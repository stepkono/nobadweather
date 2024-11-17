//
//  OutfitManagerTests.swift
//  OutfitManagerTests
//
//  Created by Stepan Konoplianko on 19.10.24.
//

import XCTest
@testable import NoBadWeather

final class OutfitManagerTests: XCTestCase {
    var forecast: [String: Any]?
    
    override func setUpWithError() throws {
        print("[STARTING TESTS]")
        forecast = !fetchDictFromJSON().isEmpty ? fetchDictFromJSON() : nil
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testForecastNotNil() {
        XCTAssertNotNil(forecast, "[FAILED]: The forecast is not available.")
    }
    
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
