//
//  Leaderboard.swift
//  JsapiApi
//
//  Created by youssef on 9/14/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import UIKit
import XCTest

class WalletTest: XCTestCase {

    var theUser:User = User()
    var newUser=RegisteredUser()
    override func setUp() {
        super.setUp()
        JsapiAPi.jsapiInit("http://localhost:8080/jsapi", client_id: "knetik",secrect_key: "superSUPERsuperSECRET")
        doUserRegisteration()
        
        DoLogin();
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
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
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }
    
    func doUserRegisteration()
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
                
                self.newUser = registeredUser
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "regiteration failed")
                    println(errormessage)
                }else
                {
                    XCTAssertTrue((registeredUser.getFullname() == userDetails["fullname"]) , "regiteration pass")
                    
                    println(registeredUser.getFullname())
                    // Valid Response
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }
    
    func testChangeWallet()
    {
        let readyExpectation = expectationWithDescription("ready")

        var walletRequest = WalletRequest();
        walletRequest.userId = newUser.getId()
        walletRequest.username = newUser.getUsername()
        walletRequest.delta = 100000
        walletRequest.currencyType = "SP"
        walletRequest.reason = "No Reason"
        
               
        var params=walletRequest.toDictionary()

        var walletService = WalletService()
        walletService.walletChange(params as! Dictionary<String,AnyObject>)
            {
                (wallet:Wallet,errormessage:String,issuccess:Bool) in
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
    
    
    func testdDeductionsWallet()
    {
        let readyExpectation = expectationWithDescription("ready")
        
        var walletRequest = WalletRequest();
        walletRequest.userId = newUser.getId()
        walletRequest.username = newUser.getUsername()
        walletRequest.delta = -1000
        walletRequest.currencyType = "SP"
        walletRequest.reason = "No Reason"
        
        
        var params=walletRequest.toDictionary()
        
        var walletService = WalletService()
        walletService.walletChange(params as! Dictionary<String,AnyObject>)
            {
                (wallet:Wallet,errormessage:String,issuccess:Bool) in
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
