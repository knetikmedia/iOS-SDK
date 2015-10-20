//
//  FriendShipTest.swift
//  JsapiApi
//
//  Created by youssef on 7/2/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import UIKit
import XCTest

class FriendShipTest: XCTestCase {

    var theUser:User = User()
    var theRegisteredUser :RegisteredUser=RegisteredUser();
    override func setUp() {
        super.setUp()
        JsapiAPi.jsapiInit("http://localhost:8080/jsapi", client_id: "knetik",secrect_key: "superSUPERsuperSECRET")
        testDoLogin();
        testGetUserInfo()
        testUserRegisteration()
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

    func testAddFriend()
    {
        testUserRegisteration()
        let readyExpectation = expectationWithDescription("ready")
        var params=Dictionary<String,AnyObject>()
        params["target_user_id"]=self.theRegisteredUser.getId()
        params["user_id"]=NSString(format:"%d",theUser.getId())
        var friendShip = FriendshipService()
        
        friendShip.addFriend(params)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testAddFriend failed")
                }else
                {
                    XCTAssertTrue(issuccess, "testAddFriend pass")
                    // Valid Response
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }
    
    func testGetFriend()
    {
        let readyExpectation = expectationWithDescription("ready")

        var params=Dictionary<String,AnyObject>()
        params["page"]=1
        params["size"]=20
        
        var friendShip = FriendshipService()
        
        friendShip.getFriends(params)
            {
                (friends:Friend,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testGetFriend failed")
                }else
                {
                    XCTAssertTrue(issuccess, "testGetFriend pass")
                    var friendsList=friends.getFriends()
                    var invitedList=friends.getInvites()
 
                }
                readyExpectation.fulfill()

        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }
    
    func testSearchFriend()
    {
        let readyExpectation = expectationWithDescription("ready")

        var params=Dictionary<String,AnyObject>()
        params["friend"]="tes"
        params["page"]=1
        params["limit"]=20
        
        var friendShip = FriendshipService()
        
        friendShip.searchFriends(params)
            {
                (friends:Friend,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testSearchFriend failed")
                }else
                {
                    XCTAssertTrue(issuccess, "testSearchFriend pass")
                    var friendsList=friends.getFriends()
                    var invitedList=friends.getInvites()
                    
                    // Valid Response
                }
                readyExpectation.fulfill()

        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }
    
    func testRemoveFriend()
    {
        testAddFriend()
        let readyExpectation = expectationWithDescription("ready")
        var params=Dictionary<String,AnyObject>()
        
        var friendShip = FriendshipService()
        
        friendShip.removeFriend(params)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testRemoveFriend failed")
                }else
                {
                    XCTAssertTrue(issuccess, "testRemoveFriend pass")
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
