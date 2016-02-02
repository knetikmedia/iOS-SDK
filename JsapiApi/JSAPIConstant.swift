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
class var OAUTH_TOKEN:String {return "/oauth/token" }  // Login EndPoNSNumber class
class var TOKENBREAR:String {return "" }
//Cart EndPoNSNumbers 
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
class var REGISTER:String {return "/services/latest/registration" }  // Register EndpoNSNumber
class var FORGOTPASSWORD:String {return "/services/latest/registration/forgotpassword"};
class var GUESTUPGRADE:String {return "/services/latest/registration/guestupgrade"};
class var GUESTS:String {return "/services/latest/registration/guests"};
//EndRegister
    
//User
class var GETUSERINFO:String {return "/services/latest/users/me" }
class var GETACHIEVEMENT:String {return "/services/latest/user/getachievement" }
class var UPDATEUSERINFO:String {return "/services/latest/users/me"};
class var SETUSERPASSWORD:String {return "/services/latest/user/%@/password"};
//EndUser

    
//Comment
class var ADDCOMMENT:String {return "/services/latest/media/videos/%@/comments" }
class var DELETECOMMENT:String {return "/services/latest/media/videos/%@/comments"};
class var COMMENTLIST:String {return "/services/latest/media/videos/%@/comments"};
    
//End Comment
    
//FriendShip
    class var ADDFRIEND:String {return "/services/latest/friendship/addfriend"}
    class var GETFRIENDS:String {return "/services/latest/friendship/getfriends"}
    class var REMOVEFRIEND:String {return "/services/latest/friendship/removefriend"}
    class var SEARCHFRIEND:String {return "/services/latest/friendship/searchfriends"}

//End FriendShip
    
//Videos

    class var GETVIDEOS:String {return "/services/latest/media/videos"}
    class var GETUSERVIDEOS:String {return "/services/latest/users/%@/videos"} // %@  userID
    class var GETMYFAVORITESVIDEOS:String {return "/services/latest/users/%@/videos/favorited"} //%@ userID
    class var DELETEVIDEO:String {return "/services/latest/media/videos/%@"};
    class var VIEWVIDEO:String {return "/services/latest/media/videos/%@/views"};

    class var GETFRIENDSVIDEO:String {return "/services/latest/users/%@/friends/videos"}
    class var ADDVIDEO:String {return "/services/latest/media/videos"}
    class var UPDATEVIDEODETAILS:String {return "/services/latest/media/videos/%@"} //videoID
    class var ADDUSERUPLOADEDMEDIAITEMASSESTS:String {return "/services/latest/videos/assets"}
    class var ADDCONTRIBUTOR:String {return "/services/latest/media/videos/%@/contributors"}
    class var ADDRELATEDVIDEO:String {return "/services/latest/media/videos/%@/related"}

    

    
//End DISPOSITION
   
    //DISPOSITION
    
    class var DISPOSITION:String {return "/services/latest/dispositions"}
    class var GETMINEDISPOSITION:String {return "/services/latest/dispositions/mine"}

    class var GETMYDISPOSTION:String {return "/services/latest/dispositions"}

    class var ADDDISPOSITION:String {return "/services/latest/dispositions/%@/%@"}

    class var DELETEDISPOSITION:String {return "/services/latest/dispositions/%@"};
   
    class var GETDISPOSITIONCOUNT:String {return "/services/latest/dispositions/count"};

    
//End DISPOSITION
    
    
    //FLAG
    
    class var FLAGS:String {return "/services/latest/media/videos/%@/moderation"}
    class var COMMENTFLAGS:String {return "/services/latest/media/videos/%@/moderation"}

    class var GETFLAGS:String {return "/services/latest/flags"};
    class var DELETEFLAG:String {return "/services/latest/flags/%@"};

    //End FLAG

    
    //METRIC
    
    class var ADDMETRIC:String {return "/services/latest/metrics"}
    
    //End METRIC
    
    
    //Leaderboard
    
    class var LEADERBOARDS:String {return "/services/latest/leaderboards"}
    class var GETSTRATEGIES:String {return "/services/latest/leaderboards/strategies"}
    class var GETUSERRANK:String {return "/services/latest/leaderboards/%@/users/%@/rank"}
    
    //End Leaderboard
    class var WALLETCHANGE:String {return "/services/latest/admin/walletchange"}

    //Wallet

    
//Store
    class var GETPAGE:String {return "/services/latest/store/getpage"};

//End Store
    
//FAVORITE
    class var ADDFAVORITE:String {return "/services/latest/favorite/add"};
    class var GETFAVORITES:String {return "/services/latest/favorite/list"};
    class var DELETEFAVORITE:String {return "/services/latest/favorite/delete"};
    
//End FAVORITE
    
//categories
    class var GETCATEGORIES:String {return "/services/latest/categories"};

    class var BREEVENT:String {return "/services/latest/bre/fireevent"};
    
    class var NOTIFICATIONS:String {return "/api/notifications"};
    class var READNOTIFICATIONS:String {return "/api/notifications/%@"};

    //
    class var GETARTISTS:String {return "/services/latest/media/artists"}

}


