//
//  Leaderboard.swift
//  JsapiApi
//
//  Created by youssef on 9/14/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import UIKit
import XCTest

class LeaderboardTest: XCTestCase {

    var theUser:User = User()

    override func setUp() {
        super.setUp()
        JsapiAPi.jsapiInit("http://localhost:8080/jsapi", client_id: "knetik",secrect_key: "superSUPERsuperSECRET")
        testDoLogin();
        testGetUserInfo();
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testDoLogin()
    {
        let readyExpectation = expectationWithDescription("ready")
        var userDetails=Dictionary<String,String>()
        userDetails["username"] = "admin"
        userDetails["password"] = "123123"
        JsapiAPi.sharedInstance.doUserLogin(userDetails)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "Login failed")
                }else
                {
                    XCTAssertTrue(issuccess, "Login pass")
                }
                readyExpectation.fulfill()
                
                
        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }
    
    func testGetUserInfo()
    {
        
        testDoLogin();
        let readyExpectation = expectationWithDescription("ready")
        var userDetails=Dictionary<String,String>()
        var userObject = UserService()
        userObject.getUserInfo(userDetails)
            {
                (user:User,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testGetUserInfo failed")
                }else
                {
                    self.theUser=user
                    XCTAssertTrue(issuccess, "testGetUserInfo pass")
                }
                readyExpectation.fulfill()
                
        }
        self.waitForExpectationsWithTimeout(6.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }
    
    
    func testGetLeaderboards()
    {
        let readyExpectation = expectationWithDescription("ready")
        
        var params=Dictionary<String,String>()
        params["context_type"]="activity"
        params["context_id"]="7"
        var leaderboard = LeaderboardService()
        leaderboard.getLeaderboards(params)
            {
                (leaderboards:Leaderboard,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testItemCommentsList failed")
                }else
                {
                    XCTAssertTrue(issuccess, "testItemCommentsList pass")
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(6.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
        
    }
    
    
    func testGetStrategies()
    {
        let readyExpectation = expectationWithDescription("ready")
        
        var params=Dictionary<String,String>()
    
        var leaderboard = LeaderboardService()
        leaderboard.getStrategies(params)
            {
                (strategies:Array<String>,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testItemCommentsList failed")
                }else
                {
                    XCTAssertTrue(issuccess, "testItemCommentsList pass")
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(6.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
        
    }
    
    
    func testGetUserRank()
    {
        let readyExpectation = expectationWithDescription("ready")
        
        var params=Dictionary<String,String>()
        params["leaderboardId"]="7"
        params["userId"]="29081"
        var leaderboard = LeaderboardService()
        leaderboard.getUserRank(params)
            {
                (rank:Entrie,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testItemCommentsList failed")
                }else
                {
                    XCTAssertTrue(issuccess, "testItemCommentsList pass")
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(6.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
        
    }



    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
