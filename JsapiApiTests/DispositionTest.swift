//
//  CommentsTest.swift
//  JsapiApi
//
//  Created by youssef on 7/2/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import UIKit
import XCTest

class DispositionTest: XCTestCase {

    var theUser:User = User()
    var comment_id="33"
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
        let userDetails=Dictionary<String,String>()
        let userObject = UserService()
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
    
    
    func testGetDispostions()
    {
        let readyExpectation = expectationWithDescription("ready")

        var params=Dictionary<String,String>()
        params["context"]="video"
        params["context_id"]="1"
        var disposition = DispositionService()
        disposition.getDispositions(params)
            {
               (dispositions:Array<Disposition>,errormessage:String,issuccess:Bool) in
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
    
  
    func testAddDisposition()
    {
        let readyExpectation = expectationWithDescription("ready")
        
        var params=Dictionary<String,String>()
        var disposition=Disposition()
        disposition.context="video"
        disposition.contextId=1
        disposition.name="like"
        
        var dispositionservice = DispositionService()
        dispositionservice.addDisposition(disposition.toDictionary() as! Dictionary<String, AnyObject>)
            {
                (result:Disposition,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testAddCommentToItem failed")
                }else
                {
                    XCTAssertTrue(issuccess, "testAddCommentToItem pass")
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(6.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
        
    }

    func testDeleteDisposition()
    {
        let readyExpectation = expectationWithDescription("ready")
        var params=Dictionary<String,String>()
        params["id"]="1"
        var video = DispositionService()
        video.deleteDisposition(params)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testDeleteDisposition failed")
                }else
                {
                    XCTAssertTrue(issuccess, "testDeleteDisposition pass")
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
