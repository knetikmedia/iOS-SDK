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
    var theNewVideo = Video()
    
    override func setUp() {
        super.setUp()
        JsapiAPi.jsapiInit("http://localhost:8080/jsapi", client_id: "knetik",secrect_key: "superSUPERsuperSECRET")

        DoLogin()
        GetUserInfo()
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
    
    func GetUserInfo()
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
                    if(result.count>0){
                    self.lastVideo=result.last!
                    }
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
        
        var video = VideoService()
        video.getFriendsVideos("1",params:videoParams)
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
        addedVideo.author=SimpleUser()
        addedVideo.authored=1439404367
        addedVideo.author.id=1
        addedVideo.author.displayName="youssef"
        addedVideo.height=400
        addedVideo.embed="ok"
        addedVideo.location="www.google.com"
        addedVideo.longDescription="long"
        addedVideo.shortDescription="short"
        addedVideo.name="youssef Videp"
        addedVideo.longDescription = "Long Description";
        addedVideo.shortDescription = "Short Description";
        addedVideo.name = "artist";
        addedVideo.embed = "<>";
        addedVideo.videoExtension = ".mp4";
        addedVideo.height = 100;
        addedVideo.length = 100;
        addedVideo.location = "http://www.google.com";
        addedVideo.mimeType = "video/mp4";
        addedVideo.size = 10000;
        addedVideo.width = 100;
        var videoParams=addedVideo.toDictionary()
        
        var video = VideoService()
        
        video.addVideo(videoParams as! Dictionary<String, AnyObject>)
            {
                (result:Video,errormessage:String,issuccess:Bool) in
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

    
    
    func testUpdateViewsCount()
    {
        let readyExpectation = expectationWithDescription("ready")

        var params=Dictionary<String,String>()
        var video = VideoService()
        video.updateVideoViewsCount("193", params: params)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
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


    func testUpdateVideoDetails()
    {
        testAddVideo()
        
        let readyExpectation = expectationWithDescription("ready")
        var addedVideo=Video()
    
        
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

    func testDeleteVideo()
    {
        let readyExpectation = expectationWithDescription("ready")
        var params=Dictionary<String,String>()
        params["id"]="1"
        var video = VideoService()
        video.deleteVideo(params)
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

    func testAddUserUploadedMediaItemAssests()
    {
        testAddVideo()
        
        let readyExpectation = expectationWithDescription("ready")
        var addedVideo=Video()
        
        var asset=Asset()
        asset.assetDescription="Asset Description"
        asset.assetHash="abcd12345667"
        asset.path="www.google.com"
        asset.sortOrder=1
        asset.type="a"
        asset.url="www.google.com"
        var assetsArray = [Asset]()
        assetsArray.append(asset)
        
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
