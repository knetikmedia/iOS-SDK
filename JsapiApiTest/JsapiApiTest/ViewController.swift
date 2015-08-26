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
    var username = "admin"
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
    Test User Login
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
    Test User Logout
    */
    @IBAction func testLogout()
    {
        JsapiAPi.sharedInstance.doUserLogout()
    }

    
    /*
    Test Cart Function
    */
    @IBAction func testCreateCard()
    {
        var cardDetails=Dictionary<String,String>()
        var cartObject=CartService()
        cartObject.createCart(cardDetails)
            {
                (cartNumber:String,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println("Create Card SKU Failed")
                }else
                {
                    self.cartID=cartNumber
                    self.cartNumber=cartNumber
                    print(cartNumber)
                }

                
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
        var cartObject=CartService()
        cartObject.createCartSku(skuDetails)
            {
                (skus:Array<String>,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println("Create Card SKU Failed")
                }else
                {
                    print(skus)
                }

        }
    }

    
    
    /*
    Test Cart SKU Function
    */
    @IBAction func testgetCart()
    {
        var params=Dictionary<String,String>()
        var cartObject=CartService()
        cartObject.getCart(params,guidID: self.cartNumber)
            {
                (cartDetails:CartDetails,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testgetCart Failed")
                }else
                {
                    println("testgetCart PASS")
                    print(cartDetails.getCart().getCity())

                }
                
                
        }
    }

    
    
    /*
    Test Cart Checkout
    */
    @IBAction func testCartCheckout()
    {
        var params=Dictionary<String,String>()
      //  params["cartguid"]=cartNumber
        var cartObject=CartService()
        cartObject.cartCheckout(params,itemID:cartNumber)
            {
                (checkout:Checkout,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    print(errormessage)
                }else
                {
                    print(checkout.getInvoices()[0].getBillingAddress1())
                }
                
        }
    }

    /*
    Test Cart Checkout
    */
    @IBAction func testCartDiscount()
    {
        var params=Dictionary<String,String>()
        params["sku"]="KIA1425410545-1808"
        var cartObject=CartService()
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
        var cartObject=CartService()
        cartObject.cartCountries(params,itemID:cartNumber)
            {
                (countries:Array<Country>,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println(errormessage)
                }else
                {
                    print(countries)
                }
                
        }
    }

    /*
    Test Cart testitems
    PUT /services/latest/carts/{cartGUID}/items
    */
    @IBAction func testCartChangeItems()
    {
        var params=Dictionary<String,String>()
           params["catalog_id"]="72"
           params["catalog_sku_id"]="72"
           params["quantity"]="10"
               var cartObject=CartService()
        cartObject.changeItem(params,itemID:cartID)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
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
        var cartObject=CartService()
        cartObject.addCartItems(params,itemID:cartNumber)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
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
        var cartObject=CartService()
        cartObject.checkShippable(params,itemID:self.cartNumber)
            {
                (shippable:Shippable,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println(errormessage)
                }else
                {
                    print(shippable.getCartId())
                }
                
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

        var cartObject=CartService()
        cartObject.modifyShippingAddress(params,itemID:cartID)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    print(errormessage)
                }else
                {
                    print(result)
                }
                
        }
    }

    
// ----------------------------------REGISTER--------------------------------------------------------//
 
    @IBAction func testUserRegisteration()
    {
        var userDetails=Dictionary<String,String>()
        userDetails["username"]="sswq12312ww31ss23ewqssweq"
        userDetails["password"]="123123"
        userDetails["email"]="sssw23ss12123sww@knetik.com"
        userDetails["gender"]="male"
        userDetails["fullname"]="yssosww123ussssefm2aher"
        var regObject = Registration()
        regObject.doUserRegistration(userDetails)
            {
                (registeredUser:RegisteredUser,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println(errormessage)
                }else
                {
                    println(registeredUser.getFullname())
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
                (result:AnyObject,errormessage:String,issuccess:Bool) in
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
                (guest:GuestUser,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println(errormessage)
                    return;
                }else
                {
                    println("testUserRegisteration PASS")
                    // Valid Response
                
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
                            println("testDoLogin Failed")
                        }else
                        {
                            println("testDoLogin PASS")
                            
                        }
                        var userDetails=Dictionary<String,String>()
                        userDetails["username"]="eeecrrr"
                        userDetails["password"]="123123"
                        userDetails["email"]="ddddddd@knetik.com"
                        userDetails["gender"]="male"
                        userDetails["fullname"]="wewecerer"
                        var regObject = Registration()
                        
                        regObject.guestUpgrade(userDetails)
                            {
                                (result:AnyObject,errormessage:String,issuccess:Bool) in
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

    }

    @IBAction func testGuestUser()
    {
        var userDetails=Dictionary<String,String>()
        var regObject = Registration()
        regObject.guests(userDetails)
            {
                (guestUser:GuestUser,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testUserRegisteration Failed")
                    return;
                }else
                {
                    self.username=guestUser.getUsername()
                    self.password=guestUser.getPassword()
                    // Valid Response
                }
                       }
    }

// ----------------------------------REGISTER--------------------------------------------------------//
    
// ----------------------------------USER--------------------------------------------------------//
    @IBAction func testGetUserInfo()
    {
        var userDetails=Dictionary<String,String>()
        var userObject = UserService()
        userObject.getUserInfo(userDetails)
            {
                (user:User,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testUserRegisteration Failed")
                    println(errormessage)

                }else
                {
                    println("testUserRegisteration PASS")
                    println(user.getFullname())

                    // Valid Response
                }

        }
    }
    
    @IBAction func testUpdateUser()
    {
        var value = "knetik config value"

        var userObject = UserService()
        userObject.updateUserInfo("display_name",params:value)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testUpdateUser Failed")
                    println(errormessage)

                }else
                {
                    println("testUpdateUser PASS")
                    // Valid Response
                }
        }
    }

    @IBAction func testSetPassword()
    {
        var userDetails=Dictionary<String,String>()
        userDetails["password"]="123123"
        var userObject = UserService()
        userObject.setPassword(userDetails,userID:"7700")
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testSetPassword Failed")
                    println(errormessage)

                }else
                {
                    println("testSetPassword PASS")
                    // Valid Response
                }
                println(result)
        }
    }
//////////////////COMMENTS//////////////////////////////////////////////////
    
    @IBAction func testItemCommentsList()
    {
        var params=Dictionary<String,String>()
        params["context"]="video"
        params["context_id"]="1"

        var comment = CommentService()
        comment.commentsList(params)
            {
                (comments:Array<Comment>,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testItemCommentsList Failed")
                    println(errormessage)
                }else
                {
                        if(comments.count>0){
                            var comment=comments[comments.count-1] as Comment
                            self.comment_id=String(comment.getCommentId())
                            println("comment id is "+self.comment_id)
                    }
                    // Valid Response
                }
              
        }
    }

    @IBAction func testAddCommentToItem()
    {
        var params=Dictionary<String,String>()
        params["content"]="hello"
        params["contextId"]="1"
        params["context"]="video"

        var comment = CommentService()
        comment.addComment(params)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testAddCommentToItem Failed")
                    println(errormessage)
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
        
        var comment = CommentService()
        comment.deleteComment(params)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
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
        
        var comment = CommentService()
        comment.deleteComment(params)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testRemoveCommentToItem Failed")
                }else
                {
                    println("testRemoveCommentToItem PASS")
                    // Valid Response
                }
                println(result)
        }
    }

    
//////////////////FRIENDSHIP//////////////////////////////////////////////////
    @IBAction func testFriendShip()
    {
        var params=Dictionary<String,AnyObject>()
        params["target_user_id"]=4330
        params["user_id"]=1
 
        var friendShip = FriendshipService()
        
        friendShip.addFriend(params)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
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
      
        var friendShip = FriendshipService()
        
        friendShip.getFriends(params)
            {
                (friends:Friend,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testGetFriend Failed")
                }else
                {
                    println("testGetFriend PASS")
                    var friendsList=friends.getFriends()
                    var invitedList=friends.getInvites()

                    // Valid Response
                }
        }
    }

    @IBAction func testSearchFriend()
    {
        var params=Dictionary<String,AnyObject>()
        params["friend"]="tes"
        params["page"]=1
        params["limit"]=20
        
        var friendShip = FriendshipService()
        
        friendShip.searchFriends(params)
            {
                (friends:Friend,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testGetFriend Failed")
                }else
                {
                    println("testGetFriend PASS")
                    var friendsList=friends.getFriends()
                    var invitedList=friends.getInvites()
                    
                    // Valid Response
                }
        }
    }
    @IBAction func testRemoveFriend()
    {
        var params=Dictionary<String,AnyObject>()
        params["target_user_id"]=4330
        params["user_id"]=1
        var friendShip = FriendshipService()
        
        friendShip.removeFriend(params)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
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
                (pages:Array<Page>,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testStoreGetPage Failed")
                }else
                {
                    var storeArray=pages
                    println(pages)

                    println("testStoreGetPage PASS")
                    // Valid Response
                }
        }
    }
    
    
//////////////////GET FAVORITES//////////////////////////////////////////////////
    
    @IBAction func testAddFavorite()
    {
        var params=Dictionary<String,AnyObject>()
        params["id"]=1
        
        var favorite = FavoriteService()
        
        favorite.addFavoriteItem(params)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println("Test Add Favorite Failed")
                }else
                {
                    println("Test Add Favorite PASS")
                    // Valid Response
                }
                println(errormessage)
        }
    }
    
    @IBAction func testGetFavorites()
    {
        var params=Dictionary<String,AnyObject>()
        var favorite = FavoriteService()
         favorite.getFavorites(params)
            {
                (favorites:Array<Favorite>,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println("test Get Favorites Failed")
                }else
                {
                    var favist=favorites
                    
                    println("test Get Favorites PASS")
                    // Valid Response
                }
                println(errormessage)
        }
    }
    
    @IBAction func testDeleteFavorites()
    {
        var params=Dictionary<String,AnyObject>()
        params["id"]=1
       
        var favorite = FavoriteService()
        
        favorite.deleteFavorite(params)
            {
                (result:AnyObject,errormessage:String,issuccess:Bool) in
                if(!issuccess)
                {
                    println("test Delete Favorites Failed")
                }else
                {
                    println("test Delete Favorites PASS")
                    // Valid Response
                }
                println(errormessage)
        }
    }

//////////////////End FAVORITES//////////////////////////////////////////////////


}

