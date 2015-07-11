//
//  VideoTest.swift
//  JsapiApi
//
//  Created by youssef on 7/6/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import UIKit
import XCTest
class VideoTest: XCTestCase {

    var theUser:User = User()
    var lastVideo=Video()
    var theNewVideo = NewVideo()
    override func setUp() {
        super.setUp()
        JsapiAPi.jsapiInit("http://localhost:8080/jsapi", client_id: "knetik",secrect_key: "superSUPERsuperSECRET")

        testDoLogin()
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

    
    func testGetVideos()
    {
        let readyExpectation = expectationWithDescription("ready")

        var videoParams=Dictionary<String,AnyObject>()
        videoParams["page"]=1
        videoParams["size"]=20
        videoParams["artist"]=""

       var video = VideoService()
        video.getVideos(videoParams)
        {
            (result:Array<Video>,errormessage:String,issuccess:Bool) in
            if(!issuccess)
            {
                XCTAssertTrue(issuccess, "testGetVideos failed")

            }else
            {
                XCTAssertTrue(issuccess, "testGetVideos pass")

            }
            readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(6.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    
    }
    
    
    func testGetUserVideos()
    {
        let readyExpectation = expectationWithDescription("ready")
        
        var videoParams=Dictionary<String,AnyObject>()
        videoParams["page"]=1
        videoParams["size"]=20
        videoParams["artist"]=""
        
        var video = VideoService()
        video.getUserVideos(NSString(format: "%d",theUser.getId())as String, params: videoParams)
            {
                (result:Array<Video>,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testGetUserVideos failed")
                    
                }else
                {
                    XCTAssertTrue(issuccess, "testGetUserVideos pass")
                    self.lastVideo=result.last!
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(6.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
        
    }
    
    func testGetMyFavoritesVideos()
    {
        let readyExpectation = expectationWithDescription("ready")
        
        var videoParams=Dictionary<String,AnyObject>()
        videoParams["page"]=1
        videoParams["size"]=20
        videoParams["artist"]=""
        
        var video = VideoService()
        video.getMyFavoritesVideos(NSString(format: "%d",theUser.getId())as String, params: videoParams)
            {
                (result:Array<Video>,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testGetMyFavoritesVideos failed")
                }else
                {
                    XCTAssertTrue(issuccess, "testGetMyFavoritesVideos pass")
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(6.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
        
    }

    func testGetMyFriendsVideos()
    {
        let readyExpectation = expectationWithDescription("ready")
        
        var videoParams=Dictionary<String,AnyObject>()
        videoParams["page"]=1
        videoParams["size"]=20
        videoParams["artist"]=""
        
        var video = VideoService()
        video.getFriendsVideos(videoParams)
            {
                (result:Array<Video>,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testGetMyFriendsVideos failed")
                }else
                {
                    XCTAssertTrue(issuccess, "testGetMyFriendsVideos pass")
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(6.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
        
    }
    
    
    func testAddVideo()
    {
        let readyExpectation = expectationWithDescription("ready")
        var addedVideo=Video()
        addedVideo.title="added Video Title"
        addedVideo.summary="Video Summary"
        addedVideo.videodescription="description"
        addedVideo.displayable=true
        addedVideo.filename="youssef video"
        
        var asset=Asset()
        asset.assetDescription="Asset Description"
        asset.path="www.google.com"
        var assetsArray = [Asset]()
        assetsArray.append(asset)
        addedVideo.assets=assetsArray
        
        var videoParams=addedVideo.toDictionary()
        
        var video = VideoService()
        
        video.addVideo(videoParams as! Dictionary<String, AnyObject>)
            {
                (result:NewVideo,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testAddVideo failed")
                }else
                {
                    XCTAssertTrue(issuccess, "testAddVideo pass")
                }
                self.theNewVideo=result
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(6.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }


    func testUpdateVideoDetails()
    {
        testAddVideo()
        
        let readyExpectation = expectationWithDescription("ready")
        var addedVideo=Video()
        addedVideo.title="added Video Title"
        addedVideo.videodescription="description"
        
        var videoParams=addedVideo.toDictionary()
        
        var video = VideoService()
        
        video.updateVideoDetails(NSString(format:"%d",theNewVideo.id) as String,params:videoParams as! Dictionary<String, AnyObject>)
            {
                (result:String,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testUpdateVideoDetails failed")
                }else
                {
                    XCTAssertTrue(issuccess, "testUpdateVideoDetails pass")
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(6.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }

    
    func testAddUserUploadedMediaItemAssests()
    {
        testAddVideo()
        
        let readyExpectation = expectationWithDescription("ready")
        var addedVideo=Video()
        addedVideo.displayable=true
        addedVideo.id=theNewVideo.id
        addedVideo.filename="youssef video"
        
        var asset=Asset()
        asset.assetDescription="Asset Description"
        asset.assetHash="abcd12345667"
        asset.path="www.google.com"
        asset.sortOrder=1
        asset.type="a"
        asset.url="www.google.com"
        var assetsArray = [Asset]()
        assetsArray.append(asset)
        addedVideo.assets=assetsArray
        
        var videoParams=addedVideo.toDictionary()
        
        var video = VideoService()
        
        video.addUserUploadedMediaItemAssests(videoParams as! Dictionary<String, AnyObject>)
            {
                (result:String,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testAddVideo failed")
                }else
                {
                    XCTAssertTrue(issuccess, "testAddVideo pass")
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
