//
//  ViewController.swift
//  JsapiApiTest
//
//  Created by youssef on 3/3/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import UIKit
import JsapiApi
class ViewController: UIViewController {

    var cartNumber="ce56166b-cbed-4314-b5a0-8f7a7a2070a1"
    var cartID="ce56166b-cbed-4314-b5a0-8f7a7a2070a1"
    var skus=""
    var username = "admin"
    var password = "123123"
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    Test Singleton Shared Instance Object
    */
   @IBAction func testDoLogin()
    {
        var userDetails=Dictionary<String,String>()
        userDetails["username"] = username
        userDetails["password"] = password
        JsapiAPi.sharedInstance.doUserLogin(userDetails)
        {
        (result:NSDictionary,issuccess:Bool) in
            if(!issuccess)
            {
                println("testDoLogin Failed")
            }else
            {
                println("testDoLogin PASS")

            }

        }
     
    }
    
    
    
    /*
    Test Cart Function
    */
    @IBAction func testCreateCard()
    {
        var cardDetails=Dictionary<String,String>()
        var cartObject=Cart()
        cartObject.createCart(cardDetails)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    // Invalid Response
                    println("Create Card Failed")
                }else
                {
                    self.cartNumber=result.valueForKey("result") as String
                    self.cartID=self.cartNumber;
                     println("Create Card Pass")
                    // Valid Response
                }
                print(result)
                
        }
    }

    /*
    Test Cart SKU Function
    */
    @IBAction func testCreateCardSku()
    {
        var skuDetails=Dictionary<String,String>()
        skuDetails["quantity"]="5"
        skuDetails["prefix"]="WHAT"
        var cartObject=Cart()
        cartObject.createCartSku(skuDetails)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("Create Card SKU Failed")
                }else
                {
                    println("Create Card SKU PASS")
                }
                print(result)

        }
    }

    
    
    /*
    Test Cart SKU Function
    */
    @IBAction func testgetCart()
    {
        var params=Dictionary<String,String>()
        var cartObject=Cart()
        cartObject.getCart(params,guidID: cartNumber)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testgetCart Failed")
                }else
                {
                    println("testgetCart PASS")
                }
                print(result)
                
                
        }
    }

    
    
    /*
    Test Cart Checkout
    */
    @IBAction func testCartCheckout()
    {
        var params=Dictionary<String,String>()
      //  params["cartguid"]=cartNumber
        var cartObject=Cart()
        cartObject.cartCheckout(params,itemID:cartNumber)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testCartCheckout Failed")
                }else
                {
                    println("testCartCheckout PASS")
                }
                print(result)
                
        }
    }

    /*
    Test Cart Checkout
    */
    @IBAction func testCartDiscount()
    {
        var params=Dictionary<String,String>()
        params["sku"]="10OFF"
        var cartObject=Cart()
        cartObject.cartDiscount(params,itemID:cartNumber)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testCartCheckout Failed")
                }else
                {
                    println("testCartCheckout PASS")
                }
                print(result)
                
        }
    }
    
    
    /*
    Test Cart testCarCountries
    */
    @IBAction func testCarCountries()
    {
        var params=Dictionary<String,String>()
        var cartObject=Cart()
        cartObject.cartCountries(params,itemID:cartNumber)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testCarCountries Failed")
                }else
                {
                    println("testCarCountries PASS")
                }
                print(result)
                
        }
    }

    /*
    Test Cart testitems
    PUT /services/latest/carts/{cartGUID}/items
    */
    @IBAction func testCartChangeItems()
    {
        var params=Dictionary<String,String>()
           params["catalog_id"]="54"
           params["catalog_sku_id"]="786"
           params["quantity"]="10"
               var cartObject=Cart()
        cartObject.changeItem(params,itemID:cartID)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testCartChangeItems Failed")
                }else
                {
                    println("testCartChangeItems PASS")
                }
                print(result)
                
        }
    }
    
    
    
    
    /*
    Test Adds an item to the cart identified by GUID
    PUT /services/latest/carts/{cartGUID}/items
    */
    @IBAction func testCartAddItems()
    {
        var params=Dictionary<String,String>()
        params["catalog_id"]="54"
        params["catalog_sku_id"]="786"
        params["quantity"]="10"
        var cartObject=Cart()
        cartObject.addCartItems(params,itemID:cartNumber)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testCartAddItems Failed")
                }else
                {
                    println("testCartAddItems PASS")
                }
                print(result)
                
        }
    }

    
    
    /*
    Test Adds an item to the cart identified by GUID
    PUT /services/latest/carts/{cartGUID}/items
    */
    @IBAction func testCheckShippable()
    {
        var params=Dictionary<String,String>()
        var cartObject=Cart()
        cartObject.checkShippable(params,itemID:self.cartNumber)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testCartAddItems Failed")
                }else
                {
                    println("testCartAddItems PASS")
                }
                print(result)
                
        }
    }

    /*
    Test Adds an item to the cart identified by GUID
    PUT /services/latest/carts/{cartGUID}/items
    */
    @IBAction func testModifyShippingAddress()
    {
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

        var cartObject=Cart()
        cartObject.modifyShippingAddress(params,itemID:cartID)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testCartAddItems Failed")
                }else
                {
                    println("testCartAddItems PASS")
                }
                print(result)
                
        }
    }

    
// ----------------------------------REGISTER--------------------------------------------------------//
 
    @IBAction func testUserRegisteration()
    {
        var userDetails=Dictionary<String,String>()
        userDetails["username"]="youssef123"
        userDetails["password"]="123123"
        userDetails["email"]="yousse22f@knetik.com"
        userDetails["gender"]="male"
        userDetails["fullname"]="youssefm2aher"
        var regObject = Registration()
        regObject.doUserRegistration(userDetails)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testUserRegisteration Failed")
                }else
                {
                    println("testUserRegisteration PASS")
                    // Valid Response
                }
        }
    }

    
    @IBAction func testForgotPassword()
    {
        var userDetails=Dictionary<String,String>()
        userDetails["username"]="admin"
        userDetails["email"]="admin@knetik.com"
        userDetails["newpassword"]="601f1889667efaebb33b8c12572835da3f027f78"
     //   userDetails["secrethash"]="9d97a5892b0bf1b1af208b53e6c9f35986a0b123"
        userDetails["plaintext"]="true"
        var regObject = Registration()

        regObject.forgotPassword(userDetails)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testUserRegisteration Failed")
                }else
                {
                    println("testUserRegisteration PASS")
                    // Valid Response
                }
        }
    }

    @IBAction func testUpdateGuest()
    {
        var userDetails=Dictionary<String,String>()
        var regObject = Registration()
        regObject.guests(userDetails)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testUserRegisteration Failed")
                }else
                {
                    println("testUserRegisteration PASS")
                    // Valid Response
                }
                var result2=result.valueForKey("result") as NSDictionary
                self.username=result2.valueForKey("username") as String
                self.password=result2.valueForKey("password") as String
                
                var userDetails=Dictionary<String,String>()
                userDetails["username"] = self.username
                userDetails["password"] = self.password
                JsapiAPi.sharedInstance.doUserLogin(userDetails)
                    {
                        (result:NSDictionary,issuccess:Bool) in
                        if(!issuccess)
                        {
                            println("testDoLogin Failed")
                        }else
                        {
                            println("testDoLogin PASS")
                            
                        }
                        var userDetails=Dictionary<String,String>()
                        userDetails["username"]="meyouwwwsse22f"
                        userDetails["password"]="123123"
                        userDetails["email"]="meyoussqqqqef@knetik.com"
                        userDetails["gender"]="male"
                        userDetails["fullname"]="yossuqqqqssefm2aher"
                        var regObject = Registration()
                        
                        regObject.guestUpgrade(userDetails)
                            {
                                (result:NSDictionary,issuccess:Bool) in
                                if(!issuccess)
                                {
                                    println("testUserRegisteration Failed")
                                }else
                                {
                                    println("testUserRegisteration PASS")
                                    // Valid Response
                                }
                        }

                        
                }

        }

    }

    @IBAction func testGuestUser()
    {
        var userDetails=Dictionary<String,String>()
        var regObject = Registration()
        regObject.guests(userDetails)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testUserRegisteration Failed")
                }else
                {
                    println("testUserRegisteration PASS")
                    // Valid Response
                }
                var result2=result.valueForKey("result") as NSDictionary
                self.username=result2.valueForKey("username") as String
                self.password=result2.valueForKey("password") as String
        }
    }

// ----------------------------------REGISTER--------------------------------------------------------//
    
// ----------------------------------USER--------------------------------------------------------//
    @IBAction func testGetUserInfo()
    {
        var userDetails=Dictionary<String,String>()
        var userObject = User()
        userObject.getUserInfo(userDetails)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testUserRegisteration Failed")
                }else
                {
                    println("testUserRegisteration PASS")
                    // Valid Response
                }
                println(result)
        }
    }
    
    @IBAction func testUpdateUser()
    {
        var userDetails=Dictionary<String,String>()
        userDetails["userId"]="7700"
        userDetails["configValue"]="lala"
        userDetails["configName"]="display_name"

        var userObject = User()
        userObject.updateUserInfo(userDetails)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testUserRegisteration Failed")
                }else
                {
                    println("testUserRegisteration PASS")
                    // Valid Response
                }
                println(result)
        }
    }

    @IBAction func testSetPassword()
    {
        var userDetails=Dictionary<String,String>()
        userDetails["password"]="123123"
        var userObject = User()
        userObject.setPassword(userDetails,userID:"7700")
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testUserRegisteration Failed")
                }else
                {
                    println("testUserRegisteration PASS")
                    // Valid Response
                }
                println(result)
        }
    }

}

