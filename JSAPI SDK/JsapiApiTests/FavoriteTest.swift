//
//  FavoriteTest.swift
//  JsapiApi
//
//  Created by youssef on 7/2/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import UIKit
import XCTest

class FavoriteTest: XCTestCase {

    var theUser:User = User()
    var theRegisteredUser :RegisteredUser=RegisteredUser();

    override func setUp() {
        super.setUp()
        JsapiAPi.jsapiInit("http://localhost:8080/jsapi", client_id: "knetik",secrect_key: "superSUPERsuperSECRET")
        testDoLogin();
        testGetUserInfo()
        
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
    
    func testUserRegisteration()
    {
        var userDetails=Dictionary<String,String>()
        let readyExpectation = expectationWithDescription("ready")
        userDetails["username"]=NSString(format: "meyoussef%d",Utilities.currentTimeMillis()) as String
        userDetails["password"]="123123"
        userDetails["email"]=NSString(format: "meyoussef%d@knetik.com",Utilities.currentTimeMillis()) as String
        userDetails["gender"]="male"
        userDetails["fullname"]=userDetails["username"]
        var regObject = Registration()
        regObject.doUserRegistration(userDetails)
            {
                (registeredUser:RegisteredUser,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "regiteration failed")
                }else
                {
                    self.theRegisteredUser=registeredUser
                    XCTAssertTrue((registeredUser.getFullname() == userDetails["fullname"]) , "regiteration pass")
                    print(registeredUser.getFullname())
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }


    func testAddFavorite()
    {
        testUserRegisteration()
        let readyExpectation = expectationWithDescription("ready")
        var params=Dictionary<String,AnyObject>()
        params["id"]=NSString(format: "%d",theRegisteredUser.getId()) as String
        var favorite = FavoriteService()
        
        favorite.addFavoriteItem(params)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testAddFavorite failed")
                }else
                {
                    XCTAssertTrue(issuccess, "testAddFavorite Pass")
                    // Valid Response
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }
    
    func testGetFavorites()
    {
        let readyExpectation = expectationWithDescription("ready")

        var params=Dictionary<String,AnyObject>()
        var favorite = FavoriteService()
        favorite.getFavorites(params)
            {
                (favorites:Array<Favorite>,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testGetFavorites failed")
                }else
                {
                    var favist=favorites
                    XCTAssertTrue(issuccess, "testGetFavorites pass")

                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }
    
    func testDeleteFavorites()
    {
        testAddFavorite()
        let readyExpectation = expectationWithDescription("ready")

        var params=Dictionary<String,AnyObject>()
        params["id"]=NSString(format: "%d",theRegisteredUser.getId()) as String
        var favorite = FavoriteService()
        favorite.deleteFavorite(params)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testDeleteFavorites failed")
                }else
                {
                    XCTAssertTrue(issuccess, "testDeleteFavorites pass")
                    // Valid Response
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
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
