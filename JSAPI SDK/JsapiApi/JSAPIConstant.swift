//
//  JSAPIConstant.swift
//  JsapiApi
//
//  Created by youssef on 3/3/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
class JSAPIConstant
{
class var OAUTH_TOKEN:String {return "/oauth/token" }  // Login EndPoint class
    class var TOKENBREAR:String {return "Bearer" }
//Cart EndPoints 
class var SCARTS:String {return "/services/latest/carts" }  // SCARTS because there is carts class
class var CARTSSKU:String {return "/services/latest/carts/skus" }  // SCARTS because there is carts class
class var CARTCHECKOUT:String {return "/services/latest/carts/%@/checkout" }  // %@ CARTGUID
class var CARTCOUNTRIES:String {return "/services/latest/carts/%@/countries" }  // %@ CARTGUID countries
class var CARTDISCOUNT:String {return "/services/latest/carts/%@/discounts" }  // %@ CARTGUID discount
class var CARTITEMS:String {return "/services/latest/carts/%@/items" }  // %@ CARTGUID discount
class var SHIPPINGADDRESS:String {return "/services/latest/carts/%@/shipping-address" }  // %@ CARTGUID discount
class var SHIPPABLE:String {return "/services/latest/carts/%@/shippable" }  // %@ CARTGUID discount
 ///End Carts

//registration
class var REGISTER:String {return "/services/latest/registration" }  // Register Endpoint
class var FORGOTPASSWORD:String {return "/services/latest/registration/forgotPassword"};
class var GUESTUPGRADE:String {return "/services/latest/registration/guestUpgrade"};
class var GUESTS:String {return "/services/latest/registration/guests"};
//EndRegister
    
//User
class var GETUSERINFO:String {return "/services/latest/user/getinfo" }  // GET USER INFO
class var UPDATEUSERINFO:String {return "/services/latest/user/update"}; //UPDATE USER INFO
class var SETUSERPASSWORD:String {return "/services/latest/user/%@/password"};
//EndUser

    
//Comment
class var ADDCOMMENT:String {return "/services/latest/comment/add" }  // GET USER INFO
class var DELETECOMMENT:String {return "/services/latest/comment/delete"}; //UPDATE USER INFO
class var COMMENTLIST:String {return "/services/latest/comment/list"};
class var REMOVECOMMENT:String {return "/services/latest/comment/remove"};
    
//End Comment
    
//FriendShip
    class var ADDFRIEND:String {return "/services/latest/friendship/addfriend"};
    class var GETFRIENDS:String {return "/services/latest/friendship/getfriends"};
    class var REMOVEFRIEND:String {return "/services/latest/friendship/removefriend"};
    class var SEARCHFRIEND:String {return "/services/latest/friendship/searchfriends"};


//End FriendShip
}


