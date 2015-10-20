//
//  RegistrationTest.swift
//  JsapiApi
//
//  Created by youssef on 7/2/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import UIKit
import XCTest

class RegistrationTest: XCTestCase {

    var username = ""
    var password = ""
    override func setUp() {
        super.setUp()
        JsapiAPi.jsapiInit("http://localhost:8080/jsapi", client_id: "knetik",secrect_key: "superSUPERsuperSECRET")

        // Put setup code here. This method is called before the invocation of each test method in the class.
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
        let regObject = Registration()
        regObject.doUserRegistration(userDetails)
            {
                (registeredUser:RegisteredUser,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "regiteration failed")
                    print(errormessage)
                }else
                {
                    XCTAssertTrue((registeredUser.getFullname() == userDetails["fullname"]) , "regiteration pass")
                    
                    print(registeredUser.getFullname())
                    // Valid Response
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }

    
    func testUpdateGuest()
    {
        let readyExpectation = expectationWithDescription("ready")

        let userDetails=Dictionary<String,String>()
        let regObject = Registration()
        regObject.guests(userDetails)
            {
                (guest:GuestUser,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    print(errormessage)
                    XCTAssertTrue(issuccess, "regiteration guest user failed")

                    return;
                }else
                {
                   
                    self.username=guest.getUsername()
                    self.password=guest.getPassword()
                    
                    var userDetails=Dictionary<String,String>()
                    userDetails["username"] = self.username
                    userDetails["password"] = self.password
                    JsapiAPi.sharedInstance.doUserLogin(userDetails)
                        {
                            (result:NSDictionary,issuccess:Bool) in
                            if(!issuccess)
                            {
                                XCTAssertTrue(issuccess, "Login with guest user failed")
                            }else
                            {
                            XCTAssertTrue(issuccess, "Login with guest user pass")
                            var userDetails=Dictionary<String,String>()
                            userDetails["username"]=NSString(format: "meyoussefGuestUpdate%d",Utilities.currentTimeMillis()) as String
                            userDetails["password"]="123123"
                            userDetails["email"]=NSString(format: "meyoussefGuestUpdate%d@knetik.com",Utilities.currentTimeMillis()) as String
                            userDetails["gender"]="male"
                            userDetails["fullname"]=userDetails["username"]
                            let regObject = Registration()
                            regObject.guestUpgrade(userDetails)
                                {
                                    (result:AnyObject,errormessage:String,issuccess:Bool) in
                                    if(!issuccess)
                                    {
                                        XCTAssertTrue(issuccess, "guestUpgrade failed")
                                    }else
                                    {
                                        XCTAssertTrue(issuccess, "guestUpgrade pass")
                                    }
                            }
                            }
                            
                    }
                }
                readyExpectation.fulfill()

        }
        self.waitForExpectationsWithTimeout(10.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
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
