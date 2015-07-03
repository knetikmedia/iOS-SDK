//
//  StoreTest.swift
//  JsapiApi
//
//  Created by youssef on 7/2/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import UIKit
import XCTest

class StoreTest: XCTestCase {

    override func setUp() {
        super.setUp()
        JsapiAPi.jsapiInit("http://localhost:8080/jsapi", client_id: "knetik",secrect_key: "superSUPERsuperSECRET")
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func testStoreGetPage()
    {
        let readyExpectation = expectationWithDescription("ready")

        var params=Dictionary<String,AnyObject>()
        
        params["terms"]=["test Term_1426094958_462"];
        params["limit"]=10;
        params["page"]=1;
        params["useCatalog"]=true;
        params["fullObject"]=true;
        
        var store = Store()
        
        store.getPage(params)
            {
                (pages:Array<Page>,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testStoreGetPage failed")
                }else
                {
                    var storeArray=pages
                    XCTAssertTrue(issuccess, "testStoreGetPage pass")
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
