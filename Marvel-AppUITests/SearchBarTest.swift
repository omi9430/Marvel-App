//
//  SearchBarTest.swift
//  Marvel-AppUITests
//
//  Created by omair khan on 06/06/2022.
//

import XCTest

class SearchBarTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_searchBar_and_cancelButton() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        //Arrange
        let expectation = self.expectation(description: "Wait For View & Data To Load")
        let wait = XCTWaiter.wait(for: [expectation], timeout: 8.0)
        let homeNavigationBar = app.navigationBars["Marvel_App.HomeChractersView"]
        let homeSearchBar = homeNavigationBar.searchFields["Search Character By Name"]
        let searchBarCancelButton = homeNavigationBar.buttons["Cancel"]
        
        
        //Act
        if wait == XCTWaiter.Result.timedOut {
            
            //Make Sure NavBar and Search Bar Exists

            XCTAssertTrue(homeNavigationBar.exists)
            XCTAssertTrue(homeSearchBar.exists)
            
        }else{
            XCTFail("Delay")
        }
        
            // Act on Search Bar and Cancel Button
            homeSearchBar.tap()
            homeSearchBar.typeText("Man")
            XCTAssertTrue(searchBarCancelButton.exists)
            searchBarCancelButton.tap()
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
