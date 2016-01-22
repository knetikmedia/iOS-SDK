//
//  JSAPIConstant.swift
//  JsapiApi
//
//  Created by youssef on 3/3/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
class JSAPIConstant:NSObject
{
class var OAUTH_TOKEN:String {return "/rest/oauth/token" }  // Login EndPoNSNumber class
class var TOKENBREAR:String {return "" }
//Cart EndPoNSNumbers 
class var SCARTS:String {return "/rest/services/latest/carts" }  // SCARTS because there is carts class
class var CARTSSKU:String {return "/rest/services/latest/carts/skus" }  // SCARTS because there is carts class
class var CARTCHECKOUT:String {return "/rest/services/latest/carts/%@/checkout" }  // %@ CARTGUID
class var CARTCOUNTRIES:String {return "/rest/services/latest/carts/%@/countries" }  // %@ CARTGUID countries
class var CARTDISCOUNT:String {return "/rest/services/latest/carts/%@/discounts" }  // %@ CARTGUID discount
class var CARTITEMS:String {return "/rest/services/latest/carts/%@/items" }  // %@ CARTGUID discount
class var SHIPPINGADDRESS:String {return "/rest/services/latest/carts/%@/shipping-address" }  // %@ CARTGUID discount
class var SHIPPABLE:String {return "/rest/services/latest/carts/%@/shippable" }  // %@ CARTGUID discount
 ///End Carts

//registration
class var REGISTER:String {return "/rest/services/latest/registration" }  // Register EndpoNSNumber
class var FORGOTPASSWORD:String {return "/rest/services/latest/registration/forgotpassword"};
class var GUESTUPGRADE:String {return "/rest/services/latest/registration/guestupgrade"};
class var GUESTS:String {return "/rest/services/latest/registration/guests"};
//EndRegister
    
//User
class var GETUSERINFO:String {return "/rest/services/latest/users/me" }
class var GETACHIEVEMENT:String {return "/rest/services/latest/user/getachievement" }
class var UPDATEUSERINFO:String {return "/rest/services/latest/users/me"};
class var SETUSERPASSWORD:String {return "/rest/services/latest/user/%@/password"};
//EndUser

    
//Comment
class var ADDCOMMENT:String {return "/rest/services/latest/media/videos/%@/comments" }
class var DELETECOMMENT:String {return "/rest/services/latest/media/videos/%@/comments"};
class var COMMENTLIST:String {return "/rest/services/latest/media/videos/%@/comments"};
    
//End Comment
    
//FriendShip
    class var ADDFRIEND:String {return "/rest/services/latest/friendship/addfriend"}
    class var GETFRIENDS:String {return "/rest/services/latest/friendship/getfriends"}
    class var REMOVEFRIEND:String {return "/rest/services/latest/friendship/removefriend"}
    class var SEARCHFRIEND:String {return "/rest/services/latest/friendship/searchfriends"}

//End FriendShip
    
//Videos

    class var GETVIDEOS:String {return "/rest/services/latest/media/videos"}
    class var GETUSERVIDEOS:String {return "/rest/services/latest/users/%@/videos"} // %@  userID
    class var GETMYFAVORITESVIDEOS:String {return "/rest/services/latest/users/%@/videos/favorited"} //%@ userID
    class var DELETEVIDEO:String {return "/rest/services/latest/media/videos/%@"};
    class var VIEWVIDEO:String {return "/rest/services/latest/media/videos/%@/views"};

    class var GETFRIENDSVIDEO:String {return "/rest/services/latest/users/%@/friends/videos"}
    class var ADDVIDEO:String {return "/rest/services/latest/media/videos"}
    class var UPDATEVIDEODETAILS:String {return "/rest/services/latest/videos/%@/details"} //videoID
    class var ADDUSERUPLOADEDMEDIAITEMASSESTS:String {return "/rest/services/latest/videos/assets"}
    class var ADDCONTRIBUTOR:String {return "/rest/services/latest/media/videos/%@/contributors"}


    
//End DISPOSITION
   
    //DISPOSITION
    
    class var DISPOSITION:String {return "/rest/services/latest/dispositions"}
    class var GETMINEDISPOSITION:String {return "/rest/services/latest/dispositions/mine"}

    class var GETMYDISPOSTION:String {return "/rest/services/latest/dispositions"}

    class var ADDDISPOSITION:String {return "/rest/services/latest/dispositions/%@/%@"}

    class var DELETEDISPOSITION:String {return "/rest/services/latest/dispositions/%@"};
   
    class var GETDISPOSITIONCOUNT:String {return "/rest/services/latest/dispositions/count"};

    
//End DISPOSITION
    
    
    //FLAG
    
    class var FLAGS:String {return "/rest/services/latest/media/videos/%@/moderation"}
    class var COMMENTFLAGS:String {return "/rest/services/latest/media/videos/%@/moderation"}

    class var GETFLAGS:String {return "/rest/services/latest/flags"};
    class var DELETEFLAG:String {return "/rest/services/latest/flags/%@"};

    //End FLAG

    
    //METRIC
    
    class var ADDMETRIC:String {return "/rest/services/latest/metrics"}
    
    //End METRIC
    
    
    //Leaderboard
    
    class var LEADERBOARDS:String {return "/rest/services/latest/leaderboards"}
    class var GETSTRATEGIES:String {return "/rest/services/latest/leaderboards/strategies"}
    class var GETUSERRANK:String {return "/rest/services/latest/leaderboards/%@/users/%@/rank"}
    
    //End Leaderboard
    class var WALLETCHANGE:String {return "/rest/services/latest/admin/walletchange"}

    //Wallet

    
//Store
    class var GETPAGE:String {return "/rest/services/latest/store/getpage"};

//End Store
    
//FAVORITE
    class var ADDFAVORITE:String {return "/rest/services/latest/favorite/add"};
    class var GETFAVORITES:String {return "/rest/services/latest/favorite/list"};
    class var DELETEFAVORITE:String {return "/rest/services/latest/favorite/delete"};
    
//End FAVORITE
    
//categories
    class var GETCATEGORIES:String {return "/rest/services/latest/categories"};

    class var BREEVENT:String {return "/rest/services/latest/bre/fireevent"};
    
    class var NOTIFICATIONS:String {return "/api/notifications"};

}


