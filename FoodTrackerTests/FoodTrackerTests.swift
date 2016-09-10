//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by USER on 8/13/16.
//  Copyright © 2016 Harol. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    
    
    // MARK: FoodTracker Tests
    
    // Tests to confirm that the Meal initializer returns when no name or a negative rating is provided.
    func testMealInitialization() {
    
        // Success case.
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        
        // Failure cases.
        
        //Name of the meal is empty and we assert a failure
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        //rating is less than 0 and we assert a success... jaja, We decided it was a failure!!
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
       // XCTAssertNotNil(badRating)
        //Thats why we changed the previous line to:
        XCTAssertNil(badRating, "Negative ratings are invalid, be positive")
        
        // .. and there it goes...test succeded
    }
    
    
    
    
//    Unit testing is an essential part of writing code because it helps you catch errors that you might otherwise overlook. As implied by their name, it’s important to keep unit tests modular. Each test should check for a specific, basic type of behavior. If you write unit tests that are long or complicated, it’ll be harder to track down exactly what’s going wrong.
    
    
    
    
    
    
//    override func setUp() {
//        super.setUp()
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
//    
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
