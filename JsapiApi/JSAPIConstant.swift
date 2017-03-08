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
class var SCARTS:String {return "/carts" }  // SCARTS because there is carts class
class var CARTSSKU:String {return "/carts/skus" }  // SCARTS because there is carts class
class var CARTCHECKOUT:String {return "/carts/%@/checkout" }  // %@ CARTGUID
class var CARTCOUNTRIES:String {return "/carts/%@/countries" }  // %@ CARTGUID countries
class var CARTDISCOUNT:String {return "/carts/%@/discounts" }  // %@ CARTGUID discount
class var CARTITEMS:String {return "/carts/%@/items" }  // %@ CARTGUID discount
class var SHIPPINGADDRESS:String {return "/carts/%@/shipping-address" }  // %@ CARTGUID discount
class var SHIPPABLE:String {return "/carts/%@/shippable" }  // %@ CARTGUID discount
 ///End Carts

//registration
class var REGISTER:String {return "/users" }  // Register EndpoNSNumber
class var FORGOTPASSWORD:String {return "/registration/forgotpassword"};
class var GUESTUPGRADE:String {return "/registration/guestupgrade"};
class var GUESTS:String {return "/registration/guests"};
//EndRegister
    
//User
class var GETUSERINFO:String {return "/users/me" }
class var GETACHIEVEMENT:String {return "/user/getachievement" }
class var UPDATEUSERINFO:String {return "/users/me"};
class var SETUSERPASSWORD:String {return "/user/%@/password"};
class var GETUSERINFOBYID:String {return "/users/%@"};

//EndUser

    
//Comment
class var ADDCOMMENT:String {return "/media/videos/%@/comments" }
class var DELETECOMMENT:String {return "/media/videos/%@/comments"};
class var COMMENTLIST:String {return "/media/videos/%@/comments"};
    
//End Comment
    
//FriendShip
    class var ADDFRIEND:String {return "/friendship/addfriend"}
    class var GETFRIENDS:String {return "/friendship/getfriends"}
    class var REMOVEFRIEND:String {return "/friendship/removefriend"}
    class var SEARCHFRIEND:String {return "/friendship/searchfriends"}

//End FriendShip
    
//Videos

    class var GETVIDEOS:String {return "/media/videos"}
    class var GETUSERVIDEOS:String {return "/users/%@/videos"} // %@  userID
    class var GETMYFAVORITESVIDEOS:String {return "/users/%@/videos/favorited"} //%@ userID
    class var DELETEVIDEO:String {return "/media/videos/%@"};
    class var VIDEOAVATAR:String {return "/api/videos/%@/uploader"};

    class var VIEWVIDEO:String {return "/media/videos/%@/views"};

    class var GETFRIENDSVIDEO:String {return "/users/%@/friends/videos"}
    class var ADDVIDEO:String {return "/media/videos"}
    class var UPDATEVIDEODETAILS:String {return "/media/videos/%@"} //videoID
    class var ADDUSERUPLOADEDMEDIAITEMASSESTS:String {return "/videos/assets"}
    class var ADDCONTRIBUTOR:String {return "/media/videos/%@/contributors"}
    class var ADDRELATEDVIDEO:String {return "/media/videos/%@/related"}

    

    
//End DISPOSITION
   
    //DISPOSITION
    
    class var DISPOSITION:String {return "/dispositions"}
    class var GETMINEDISPOSITION:String {return "/dispositions/mine"}

    class var GETMYDISPOSTION:String {return "/dispositions"}

    class var ADDDISPOSITION:String {return "/dispositions/%@/%@"}

    class var DELETEDISPOSITION:String {return "/dispositions/%@"};
   
    class var GETDISPOSITIONCOUNT:String {return "/dispositions/count"};

    
//End DISPOSITION
    
    
    //FLAG
    
    class var FLAGS:String {return "/media/videos/%@/moderation"}
    class var COMMENTFLAGS:String {return "/media/videos/%@/moderation"}

    class var GETFLAGS:String {return "/flags"};
    class var DELETEFLAG:String {return "/flags/%@"};

    //End FLAG

    
    //METRIC
    
    class var ADDMETRIC:String {return "/metrics"}
    
    //End METRIC
    
    
    //Leaderboard
    
    class var LEADERBOARDS:String {return "/leaderboards"}
    class var GETSTRATEGIES:String {return "/leaderboards/strategies"}
    class var GETUSERRANK:String {return "/leaderboards/%@/users/%@/rank"}
    
    //End Leaderboard
    class var WALLETCHANGE:String {return "/admin/walletchange"}
    class var GETUSERWALLETS:String {return "/users/%@/wallets"}

    //Wallet

    
//Store
    class var GETPAGE:String {return "/store/getpage"};
    class var VIRTUALITEMS:String {return "/virtualitems"};

//End Store
    
//FAVORITE
    class var ADDFAVORITE:String {return "/favorite/add"};
    class var GETFAVORITES:String {return "/favorite/list"};
    class var DELETEFAVORITE:String {return "/favorite/delete"};
    
//End FAVORITE
    
//categories
    class var GETCATEGORIES:String {return "/categories"};

    class var BREEVENT:String {return "/bre/events"};
    
    class var NOTIFICATIONS:String {return "/api/notifications"};
    class var SEENNOTIFICATIONS:String {return "/api/notifications/%@/view"};
    class var SEENALLNOTIFICATIONS:String {return "/api/notifications/viewAll"};

    class var NOTIFICATIONSCHALLENGECODE:String {return "/api/notifications/identifier"};

    class var READNOTIFICATIONS:String {return "/api/notifications/%@"};

    //
    class var GETARTISTS:String {return "/media/artists"}
    class var GETARTISTDETAILS:String {return "/media/artists/%@"}

    class var POPULARVIDEOS:String {return "/api/videos"};

    
    //CHALLENGES
    class var GETCHALLENGES:String {return "/challenges"};
    class var GETCHALLENGESBATCH:String {return "/batch"};
    class var GETCHALLENGEACTIVITYDETAILS:String {return "/challenges/%@/activities/%@"};
    class var GETCHALLENGEACTIVITY:String {return "/challenges/%@/activities"};

    
    //Config
    class var CONFIG:String {return "/configs/%@"};

    // friendship
    
    class var AUTOFRIENDSHIP:String {return "/api/friends/facebookCheck"}
    class var GETARTICLES:String {return "/media/articles"};
    class var GETACHIEVEMENTLIST:String {return "/achievements"};
    class var GETUSERACHIEVEMENTLIST:String {return "/users/%@/achievements"};
    class var GETSINGLEACHIEVEMENT:String {return "/achievements/%@"};

    
    // ERROR CONNECTION
    
    class var CONNECTION_ERROR:String {return "We're sorry, the connection to the server has been lost. Please try again."};

}


