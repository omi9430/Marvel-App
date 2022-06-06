//
//  HomeAPITestCase.swift
//  Marvel-AppTests
//
//  Created by omair khan on 06/06/2022.
//

import XCTest
@testable import Marvel_App

class HomeAPITestCase: XCTestCase {

    func test_HomeApi_With_Valid_URL_Returns_Status_Ok() throws {
        
        //Arrange
        let request = RequestHandler().getChracters()
        let expectation = self.expectation(description: "Wait For Server Response")
        
        //ACT
        HttpUtility.getApiData(url: request, resultType: ChracterData.self) { result in
            //Asserts
            XCTAssertNotNil(result)
            XCTAssertEqual("Ok", result.status)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    

}
