//
//  CartTest.swift
//  JsapiApi
//
//  Created by youssef on 7/3/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import UIKit
import XCTest

class CartTest: XCTestCase {

    var cartNumber="5893edf8-27ea-43e6-b419-7410fb301f85"
    var cartID="ce56166b-cbed-4314-b5a0-8f7a7a2070a1"
    var skus=""
    var theUser:User = User()
    var theRegisteredUser :RegisteredUser=RegisteredUser()
    
    override func setUp() {
        super.setUp()
        JsapiAPi.jsapiInit("http://localhost:8080/jsapi", client_id: "knetik",secrect_key: "superSUPERsuperSECRET")
        testDoLogin()
        testGetUserInfo()
        testCreateCard()
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

                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }

  
    func testCreateCard()
    {
        let readyExpectation = expectationWithDescription("ready")

        var cardDetails=Dictionary<String,String>()
        var cartObject=CartService()
        cartObject.createCart(cardDetails)
            {
                (cartNumber:String,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testCreateCard failed")
                }else
                {
                    self.cartID=cartNumber
                    self.cartNumber=cartNumber
                    XCTAssertTrue(issuccess, "testCreateCard pass")
                }
                
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }
    
    
    func testgetCart()
    {
        let readyExpectation = expectationWithDescription("ready")

        var params=Dictionary<String,String>()
        var cartObject=CartService()
        cartObject.getCart(params,guidID: self.cartNumber)
            {
                (cartDetails:CartDetails,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testCreateCardSku failed")
                }else
                {
                    XCTAssertTrue(issuccess, "testgetCart pass")
                    
                }
                
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })

    }
    
    
    
    /*
    Test Cart Checkout
    */
    func testCartCheckout()
    {
        testCartAddItems()
        let readyExpectation = expectationWithDescription("ready")

        var params=Dictionary<String,String>()
        //  params["cartguid"]=cartNumber
        var cartObject=CartService()
        cartObject.cartCheckout(params,itemID:cartNumber)
            {
                (checkout:Checkout,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "errormessage")
                }else
                {
                    XCTAssertTrue(issuccess, "testCartCheckout")

                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }
    
    /*
    Test Cart Checkout
    */
    func testCartDiscount()
    {
        testCreateCard()
        testgetCart()
        let readyExpectation = expectationWithDescription("ready")

        var params=Dictionary<String,String>()
        params["sku"]="KIA1421095278-5430"
        var cartObject=CartService()
        cartObject.cartDiscount(params,itemID:cartNumber)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                }else
                {
                    XCTAssertTrue(issuccess, "testCartDiscount pass ")
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }
    
    
    /*
    Test Cart testCarCountries
    */
    func testCarCountries()
    {
        testCartAddItems()
        let readyExpectation = expectationWithDescription("ready")

        var params=Dictionary<String,String>()
        var cartObject=CartService()
        cartObject.cartCountries(params,itemID:cartNumber)
            {
                (countries:Array<Country>,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testCarCountries failed ")
                }else
                {
                    XCTAssertTrue(issuccess, "testCarCountries pass ")

                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }
    
    /*
    Test Cart testitems
    PUT /services/latest/carts/{cartGUID}/items
    */
    func testCartChangeItems()
    {
        testCartAddItems();
        let readyExpectation = expectationWithDescription("ready")

        var params=Dictionary<String,String>()
        params["catalog_id"]="5"
        params["catalog_sku_id"]="5"
        params["quantity"]="10"
        var cartObject=CartService()
        cartObject.changeItem(params,itemID:cartID)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testCartChangeItems failed ")
                }else
                {
                    XCTAssertTrue(issuccess, "testCartChangeItems pass ")
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })
    }
    
    
    
    
    /*
    Test Adds an item to the cart identified by GUID
    PUT /services/latest/carts/{cartGUID}/items
    */
    func testCartAddItems()
    {
        testCreateCard()
        let readyExpectation = expectationWithDescription("ready")

        var params=Dictionary<String,String>()
        params["catalog_id"]="5"
        params["catalog_sku_id"]="5"
        params["quantity"]="0"
        var cartObject=CartService()
        cartObject.addCartItems(params,itemID:cartNumber)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testCartChangeItems failed ")
                }else
                {
                    XCTAssertTrue(issuccess, "testCartChangeItems pass ")
                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })

    }
    
    
    
    /*
    Test Adds an item to the cart identified by GUID
    PUT /services/latest/carts/{cartGUID}/items
    */
    func testCheckShippable()
    {
        let readyExpectation = expectationWithDescription("ready")

        var params=Dictionary<String,String>()
        var cartObject=CartService()
        cartObject.checkShippable(params,itemID:self.cartNumber)
            {
                (shippable:Shippable,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testCheckShippable failed ")
                }else
                {
                    XCTAssertTrue(issuccess, "testCheckShippable pass ")

                }
                readyExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: { error in XCTAssertNil(error, "Oh, we got timeout")
        })

    }
    
    /*
    Test Adds an item to the cart identified by GUID
    PUT /services/latest/carts/{cartGUID}/items
    */
    func testModifyShippingAddress()
    {

        let readyExpectation = expectationWithDescription("ready")

        var params=Dictionary<String,String>()
        params["name_prefix"]="53"
        params["first_name"]="53"
        params["last_name"]="10"
        params["shipping_address_line1"]="10"
        params["shipping_address_line2"]="10"
        params["city"]="26268"
        params["postal_state_id"]="163"
        params["zip"]="32766"
        params["email"]="youssef@gmail.com"
        params["country_id"]="225"
        params["phone_number"]="10"
        params["order_notes"]="10"
        
        var cartObject=CartService()
        cartObject.modifyShippingAddress(params,itemID:cartID)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    XCTAssertTrue(issuccess, "testModifyShippingAddress failed ")

                }else
                {
                    XCTAssertTrue(issuccess, "testModifyShippingAddress pass ")

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
