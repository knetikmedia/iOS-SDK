//
//  UserTest.swift
//  JsapiApi
//
//  Created by youssef on 7/2/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import UIKit
import XCTest

class UserTest: XCTestCase {

    override func setUp() {
        super.setUp()
        JsapiAPi.jsapiInit("http://localhost:8080/jsapi", client_id: "knetik",secrect_key: "superSUPERsuperSECRET")
        DoLogin();

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    var theUser:User = User()

    func DoLogin()
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
        self.waitForExpectationsWithTimeout(15.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }
    
    func testGetUserInfo()
    {
        
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
        self.waitForExpectationsWithTimeout(20, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }
    
//    func testUpdateUser()
//    {
//        let readyExpectation = expectationWithDescription("ready")
//
//        var value="knetik config value"
//        
//        var userObject = UserService()
//        userObject.updateUserInfo("display_name",params:value)
//            {
//                (result:AnyObject,errormessage:String,issuccess:Bool) in
//                if(!issuccess)
//                {
//                    XCTAssertTrue(issuccess, "testGetUserInfo failed")
//                    
//                }else
//                {
//                    XCTAssertTrue(issuccess, "testGetUserInfo pass")
//                    // Valid Response
//                }
//                readyExpectation.fulfill()
//
//        }
//        self.waitForExpectationsWithTimeout(6.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
//        })
//
//    }

    
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
