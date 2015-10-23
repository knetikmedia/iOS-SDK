//
//  CommentsTest.swift
//  JsapiApi
//
//  Created by youssef on 7/2/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import UIKit
import XCTest

class CommentsTest: XCTestCase {

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
    
    
    func testItemCommentsList()
    {
        let readyExpectation = expectationWithDescription("ready")

        var params=Dictionary<String,String>()
        params["id"]="4"
        var comment = CommentService()
        comment.commentsList(params)
            {
               (comments:Array<Comment>,errormessage:String,issuccess:Bool) in
               if(!issuccess)
               {
                   XCTAssertTrue(issuccess, "testItemCommentsList failed")
               }else
               {
                if(comments.count>0){
                    var comment=comments[comments.count-1] as Comment
                    self.comment_id=String(comment.getCommentId())
                    print("comment id is "+self.comment_id)
                 }
                    XCTAssertTrue(issuccess, "testItemCommentsList pass")
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(6.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })

    }
    
    func testAddCommentToItem()
    {
        let readyExpectation = expectationWithDescription("ready")

        var params=Dictionary<String,String>()
        params["item_id"]="4"
        params["comment"]="hello"
        
        var comment = CommentService()
        comment.addComment(params)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
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
    
    func testDeleteCommentToItem()
    {
        testItemCommentsList();
        let readyExpectation = expectationWithDescription("ready")
        var params=Dictionary<String,String>()
        params["id"]=self.comment_id
        var comment = CommentService()
        comment.deleteComment(params)
            {
               (result:AnyObject,errormessage:String,issuccess:Bool) in
               if(!issuccess)
               {
                   XCTAssertTrue(issuccess, "testDeleteCommentToItem failed")
               }else
               {
                   XCTAssertTrue(issuccess, "testDeleteCommentToItem pass")
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
