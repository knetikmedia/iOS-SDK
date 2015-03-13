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
        userDetails["username"]="admin"
        userDetails["password"]="123123"
        userDetails["email"]="youssef@knetik.com"
        userDetails["password"]="123123"
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
    Test Singleton Shared Instance Object
    */
   @IBAction func testUserRegisteration()
    {
        var userDetails=Dictionary<String,String>()
         userDetails["username"]="youssef"
        userDetails["password"]="123123"
        userDetails["email"]="youssef@knetik.com"
        userDetails["gender"]="male"
        JsapiAPi.sharedInstance.doUserRegistration(userDetails)
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
        cartObject.getCart(params,guidID: "8b9093b0-d3af-4ea2-a719-2f9a7f65269e")
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
        params["cartguid"]="d371475f-5b0a-4d69-95c6-9cdf05d69fef"
        var cartObject=Cart()
        cartObject.cartCheckout(params,itemID:"5143")
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
        params["sku"]="KIA1421095278-5430"
        var cartObject=Cart()
        cartObject.cartDiscount(params,itemID:"5143")
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
        cartObject.cartCountries(params,itemID:"5143")
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
           params["catalog_id"]="53"
           params["catalog_sku_id"]="53"
           params["quantity"]="10"
               var cartObject=Cart()
        cartObject.changeItem(params,itemID:"5145")
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
        params["catalog_id"]="53"
        params["catalog_sku_id"]="53"
        params["quantity"]="10"
        var cartObject=Cart()
        cartObject.addCartItems(params,itemID:"5154")
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
        cartObject.checkShippable(params,itemID:"5154")
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
        params["city"]="10"
        params["postal_state_id"]="10"
        params["zip"]="10"
        params["email"]="10"
        params["country_id"]="10"
        params["phone_number"]="10"
        params["order_notes"]="10"

        var cartObject=Cart()
        cartObject.modifyShippingAddress(params,itemID:"5154")
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

}

