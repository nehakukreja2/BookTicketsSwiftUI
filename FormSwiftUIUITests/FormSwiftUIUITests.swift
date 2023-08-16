//
//  FormSwiftUIUITests.swift
//  FormSwiftUIUITests
//
//  Created by Neha Kukreja on 16/08/23.
//

import XCTest
import SwiftUI
@testable import FormSwiftUI

final class FormSwiftUIUITests: XCTestCase {
    
    func testFlightSearchFormView_Preview() throws {
        // Given
        let previews = FlightSearchFormView_Previews.previews
        // Then
        XCTAssertNotNil(previews)
    }
    
    override func setUpWithError() throws {
        let view = FlightSearchFormView()
        
        // When
        let selectedDate = view.selectedDate
        let moveToView = view.moveToView
        let datePickerId = view.datePickerId
        let adults = view.adults
        let kids = view.kids
        let teens = view.teens
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertEqual(selectedDate, Date())
        XCTAssertFalse(moveToView)
        XCTAssertEqual(datePickerId, 0)
        XCTAssertEqual(adults, 1)
        XCTAssertEqual(kids, 0)
        XCTAssertEqual(teens, 0)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDropDownMenu() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
