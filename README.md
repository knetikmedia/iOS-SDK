### JSAPI SDK For IOS  ###
Connecting to JSAPI using IOS Swift
### How do I get set up? ###

1-Checkout JSAPI IOS SDK 

2-Go to JSAPI SDK Folder

3-Drag and Drop JsapiApi.xcodeproj to your project

4-Select your project /target /Build phases /Link Binary With Libraries

5-Click on Plus icon then add JsapiApi.framework

6-Go to your appDelegate add this line in top of your class   import JsapiApi 

7-Initialise Jsapi Object by calling jsapiInit in didFinishLaunchingWithOptions method in AppDelegate


```
#!swift

func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
{
 JsapiAPi.jsapiInit("http://localhost:8080/jsapi","","")
  return true
 }
```

# Getting Started #
once you add JsapiAPi.jsapiInit call in AppDelegate a singleton Object for JsapiAPi class created 

## JsapiAPi##
JsapiAPi class used to perform Login, logout functions and caching the Authentication token and jsapi URL

### Login ###
Right now you have an Object of JsapiAPi so all you need to do is to call *doUserLogin* function and pass the username and password parameters as shown in below Example 


```
#!swift

func testDoLogin()
    {
        var userDetails=Dictionary<String,String>()
        userDetails["username"] = username
        userDetails["password"] = password
        JsapiAPi.sharedInstance.doUserLogin(userDetails)
        {
        (result:NSDictionary,issuccess:Bool) in
            if(!issuccess)
            {
             // Login Failed
            }else
            {
            // Login Success
            }
        }
 }
```
### Login Result  ###
in case of succeed Login you don't need to take care of login response because Api is caching the token and token type for you 
and you can access it by calling *JsapiAPi.sharedInstance.getJsapiToken()*
```
#!json
({
  "access_token": "5716a78e-6afe-4ba5-ace7-6ce285545f80",
  "token_type": "bearer",
  "expires_in": 3600,
  "scope": "write read"
})
```
### Login Failed ###
in case of failed login you will need to show the error_description message to the User 

```
#!json

Optional({
  "error": "invalid_grant",
  "error_description": "Bad credentials"
})
```

### Logout ###
you can clearing your cached token and token type by calling *doUserLogout* function as shown in this example 

```
#!swift

func testLogout()
    {
        JsapiAPi.sharedInstance.doUserLogout()
    }

```

# Registration #
### Register New User ### 
you can register a new user by passing username,password ,email,gender and fullname parameters to *doUserRegistration* function 

```
#!swift

func testUserRegistration()
    {
        var userDetails=Dictionary<String,String>()
        userDetails["username"]="username"
        userDetails["password"]="password" // plain text
        userDetails["email"]="knetik@knetik.com"
        userDetails["gender"]="male"
        userDetails["fullname"]="knetik"
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
```



### Create Guest User ### 
you can Create a guest user and returns a random password by calling *guests* function 


```
#!swift

func testGuestUser()
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
                    self.username=guestUser.getUsername() // new user name
                    self.password=guestUser.getPassword() // user password 
                    // Valid Response
                }
                       }
    }
```


### Guest Upgrade ###
to upgrade your Guest account to a regular account you need first to **Logged in** with your Guest account then call *guestUpgrade* function


```
#!swift

func testUpdateGuest()
    {
                        var userDetails=Dictionary<String,String>()
                        userDetails["username"]="username"
                        userDetails["password"]="password"
                        userDetails["email"]="knetik@knetik.com"
                        userDetails["gender"]="male"
                        userDetails["fullname"]="fullname"
                        var regObject = Registration()
                        
                        regObject.guestUpgrade(userDetails)
                            {
                                (result:AnyObject,errormessage:String,issuccess:Bool) in
                                if(!issuccess)
                                {
                                    println(errormessage)
                                }else
                                {
                                    println("testUserRegisteration PASS")
                                    // Valid Response
                                }
                        }

              }
```

### Forgot Password ###
to reset your password you need to follow this steps 

1-send username and email to *forgotPassword* function and you will receive an email with *secrethash* code 

2-send username,email,newpassword,secrethash and plaintext to forgotPassword one more time as below example 


```
#!swift

func testForgotPassword()
    {
        var userDetails=Dictionary<String,String>()
        userDetails["username"]="username"  // mandatory for first and second call 
        userDetails["email"]="email@knetik.com" // mandatory for first and secondcall  
      //  userDetails["newpassword"]="password" // mandatory for second call to set the password    
     //   userDetails["secrethash"]="9d97a5892b0bf1b1af208b53e6c9f35986a0b123" // the secret code sent to your email need to be sent in second call 
     //   userDetails["plaintext"]="true" // second call 
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
```




# User #
User class used to Get and Update User Info

### Get User Info ###
you can get User Info be calling getUserInfo function from User Object 


```
#!swift

func testGetUserInfo()
    {
        var emptyParams=Dictionary<String,String>()
        var userObject = UserService()
        userObject.getUserInfo(emptyParams)
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
```
### Update User Info ###
you can update some user Info by passing configName and configValue to *updateUserInfo* function as shown in below example 

```
#!swift

func testUpdateUser()
    {
        var userDetails=Dictionary<String,String>()
        userDetails["configValue"]="knetik"
        userDetails["configName"]="display_name"

        var userObject = User()
        userObject.updateUserInfo(userDetails)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testUpdateUser Failed")
                }else
                {
                    println("testUpdateUser PASS")
                    // Valid Response
                }
                println(result)
        }
    }
```
**List of Configuration Names for Update 
**

1-avatar

2-display_name

3-lang and

4-date_of_birth format yyyy-[m]m-[d]d hh:mm:ss

## Cart ## 
Cart class used to perform below cart functions

1-Create Cart 

2-Get cart Details 

3-Cart Checkout 

4-Get cart countries 

5-change cart item 

6-add item to a cart 

7-modify shipping Address

8- cart shippable 

### Create Cart ### 
to create a cart you need to call *createCart* function and the new Cart number will be returned in result paramter

```
#!swift

func testCreateCard()
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

```

### Get cart Details ### 
you can get full cart details by passing cartNumber to  *getCart* function 
```
#!swift

func testGetCart()
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
```
### Cart Checkout ###
*checkout* function let you to closes a cart and generates an invoice


```
#!swift

func testCartCheckout()
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
```


### Get cart countries ### 
Get the list of available shipping countries per vendor


```
#!swift

func testCarCountries()
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
```

### Add item to a cart ###
you can add an item to the cart by passing the catalog_id ,catalog_sku_id , quantity and cartNumber  parameters to *addCartItems* function like below example


```
#!swift

func testCartAddItems()
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

        
```

   
### Change cart item ### 
you can changes the quantity of an item already in the cart by passing catalog_id ,catalog_sku_id , quantity and cartNumber  parameters to *changeItem*


```
#!swift

func testCartChangeItems()
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

```

### Modify shipping Address ###
the shipping address of a cart can be modified by calling *modifyShippingAddress* function like below

```
#!swift

func testModifyShippingAddress()
    {
        var params=Dictionary<String,String>()
        params["name_prefix"]="prefix"
        params["first_name"]="Knetik"
        params["last_name"]="Knetik"
        params["shipping_address_line1"]="10"
        params["shipping_address_line2"]="10" // optional
        params["city"]="City"
        params["postal_state_id"]="163"
        params["zip"]="32766"
        params["email"]="Knetik@Knetik.com"
        params["country_id"]="225"
        params["phone_number"]="+11111111"
        params["order_notes"]="notes"

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
```


### cart shippable Address ###
you can check if the Cart is requires shipping or not by calling *checkShippable* function 

```
#!swift

func testCheckShippable()
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
```

# Comment #

### Add Comment ### 

you can add Comment to an item by passing itemID and comment string to *addComment* function 


```
#!swift

func testAddCommentToItem()
    {
       var params=Dictionary<String,String>()
        params["item_id"]="4"
        params["comment"]="hello"

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
```

### Delete Comment ###
you can delete your own comment by passing Comment ID to *deleteComment* function 


```
#!swift

func testDeleteComment()
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
```
### Comment List ### 
you can fetch a a list of all comments currently attached to a given item by passing item ID to *commentsList* function 


```
#!swift

 func testItemCommentsList()
    {
        var params=Dictionary<String,String>()
        params["id"]="4"
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

```

# Friendship #

### Add Friend ###
you can add A friend to your friends List by passing target_user_id and your user_id to *addFriend* function 


```
#!swift

func testAddFriend()
    {
        var params=Dictionary<String,AnyObject>()
        params["target_user_id"]=7224 // your friend ID 
        params["user_id"]=7700  // your user ID you can Get it by calling GetUserID
        
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
```

### Get Friends ### 
you can get your friends list by passing page ,limit and your user_id to *getFriends* function 

 
```
#!swift

func testGetFriend()
    {
        var params=Dictionary<String,AnyObject>()
        params["page"]=1
        params["limit"]=20
        params["user_id"]=1

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

```

### Search Friends ###
you can search for a friend by passing search string  to *searchFriends* like below 


```
#!swift

func testSearchFriend()
    {
        var params=Dictionary<String,AnyObject>()
        params["search"]="search string"
        params["page"]=1
        params["limit"]=20
        params["user_id"]=7700
        
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
```

### Delete Friend ###
you can delete your friend by passing target_user_id to *removeFriend* function 

```
#!swift

func testRemoveFriend()
    {
        var params=Dictionary<String,AnyObject>()
        params["target_user_id"]=7224 // Target user ID to be deleted 
        params["user_id"]=7700 // your user ID
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

```
# Favorite #

### Add Favorite ###
you can add an item to your Favorite List by passing itemID to *addFavoriteItem* function 


```
#!swift

func testAddFavorite()
    {
        var params=Dictionary<String,AnyObject>()
        params["id"]=1   // item ID should be int value 
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

```

### Delete Favorite ###
you can remove your item from Favorite List by passing itemID to *deleteFavorite* function 

```
#!swift

func testDeleteFavorites()
    {
        var params=Dictionary<String,AnyObject>()
        params["id"]=1  // item ID to be Deleted 
       
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

``` 
### Favorite List ### 
you can get you Favorite List by calling getFavorites 

 
```
#!swift

func testGetFavorites()
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
```

# Store #
you get your store page by passing {terms or related},limit and page parameters to *getPage* function like below 


```
#!swift

func testStoreGetPage()
    {
        var params=Dictionary<String,AnyObject>()
        
        params["terms"]=["test Term_1426094958_462"];  //optional if related provided
        //params["related"]=["b,"a"]  // optional if terms provided 
        params["limit"]=10;
        params["page"]=1; 
        params["useCatalog"]=true; //optional 
        params["fullObject"]=true;  // optional 
        
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

```
