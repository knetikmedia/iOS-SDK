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

    var cartNumber="5893edf8-27ea-43e6-b419-7410fb301f85"
    var cartID="ce56166b-cbed-4314-b5a0-8f7a7a2070a1"
    var skus=""
    var username = "meyoussef"
    var password = "123123"
    var comment_id="33"
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
        cartObject.getCart(params,guidID: self.cartNumber)
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
        params["sku"]="KIA1425401889-7403"
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
           params["catalog_id"]="5"
           params["catalog_sku_id"]="5"
           params["quantity"]="1"
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
        params["catalog_id"]="5"
        params["catalog_sku_id"]="5"
        params["quantity"]="0"
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
        userDetails["username"]="sswqewqweq"
        userDetails["password"]="123123"
        userDetails["email"]="yousss55656e22f@knetik.com"
        userDetails["gender"]="male"
        userDetails["fullname"]="yosussefm2aher"
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
                    return;
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
                    return;
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
//////////////////COMMENTS//////////////////////////////////////////////////
    
    @IBAction func testItemCommentsList()
    {
        var params=Dictionary<String,String>()
        params["id"]="4"
        var comment = Comment()
        comment.commentsList(params)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testItemCommentsList Failed")
                }else
                {
                    println("testItemCommentsList PASS")
                    // Valid Response
                }
                 var commentsObject=result.valueForKey("result") as? NSArray
                if(commentsObject != nil){
                var comments=result.valueForKey("result") as NSArray
                if(comments.count>0){
                var comment=comments.objectAtIndex(0) as NSDictionary
                self.comment_id=String(comment.valueForKey("comment_id") as Int)
                }
                }
                println(result)
        }
    }

    @IBAction func testAddCommentToItem()
    {
        var params=Dictionary<String,String>()
        params["item_id"]="4"
        params["comment"]="hello"

        var comment = Comment()
        comment.addComment(params)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testAddCommentToItem Failed")
                }else
                {
                    println("testAddCommentToItem PASS")
                    // Valid Response
                }
                println(result)
        }
    }

    
    @IBAction func testDeleteCommentToItem()
    {
        var params=Dictionary<String,String>()
        params["id"]=self.comment_id
        
        var comment = Comment()
        comment.deleteComment(params)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testAddCommentToItem Failed")
                }else
                {
                    println("testAddCommentToItem PASS")
                    // Valid Response
                }
                println(result)
        }
    }
  
    @IBAction func testRemoveCommentToItem()
    {
        var params=Dictionary<String,String>()
        params["id"]=self.comment_id
        
        var comment = Comment()
        comment.deleteComment(params)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testAddCommentToItem Failed")
                }else
                {
                    println("testAddCommentToItem PASS")
                    // Valid Response
                }
                println(result)
        }
    }

    
//////////////////FRIENDSHIP//////////////////////////////////////////////////
    @IBAction func testFriendShip()
    {
        var params=Dictionary<String,AnyObject>()
        params["target_user_id"]=7224
        params["user_id"]=7700
        
        var friendShip = Friendship()
        
        friendShip.addFriend(params)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testAdd Friend Failed")
                }else
                {
                    println("testAdd Friend PASS")
                    // Valid Response
                }
                println(result)
        }
    }
    
    @IBAction func testGetFriend()
    {
        var params=Dictionary<String,AnyObject>()
        params["page"]=1
        params["limit"]=20
        params["user_id"]=1

        var friendShip = Friendship()
        
        friendShip.getFriends(params)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testGetFriend Failed")
                }else
                {
                    println("testGetFriend PASS")
                    // Valid Response
                }
                println(result)
        }
    }

    @IBAction func testSearchFriend()
    {
        var params=Dictionary<String,AnyObject>()
        params["search"]="tes"
        params["page"]=1
        params["limit"]=20
        params["user_id"]=7700
        
        var friendShip = Friendship()
        
        friendShip.searchFriends(params)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testSearchFriend Failed")
                }else
                {
                    println("testSearchFriend PASS")
                    // Valid Response
                }
                println(result)
        }
    }
    @IBAction func testRemoveFriend()
    {
        var params=Dictionary<String,AnyObject>()
        params["target_user_id"]=7224
        params["user_id"]=7700

        
        var friendShip = Friendship()
        
        friendShip.removeFriend(params)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testAddCommentToItem Failed")
                }else
                {
                    println("testAddCommentToItem PASS")
                    // Valid Response
                }
                println(result)
        }
    }
    
    ////////////////////////////---------------Store ------------------////////////////////////////////
    @IBAction func testStoreGetPage()
    {
        var params=Dictionary<String,AnyObject>()
        
        params["terms"]=["test Term_1426094958_462"];
        //params["related"]=["usd"]
        //params["vocabulary"]="test Vocabulary 2"
        params["limit"]=10;
        params["page"]=1;
        params["useCatalog"]=true;
        params["fullObject"]=true;
        
        var store = Store()
        
        store.getPage(params)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testStoreGetPage Failed")
                }else
                {
                    println("testStoreGetPage PASS")
                    // Valid Response
                }
                println(result)
        }
    }


}

