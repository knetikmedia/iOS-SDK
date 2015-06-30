//
//  Favorite.swift
//  JsapiApi
//
//  Created by youssef on 4/2/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class FavoriteService
{
    public init(){}

    /** add Favorite Item
    *@param params Dictionary{"id": 0} // ItemID
    *@param callback
    */
    public func addFavoriteItem(userId:String, params:Dictionary<String,AnyObject>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl=NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDFAVORITE,userId)

        JsapiRest.postrequest(methodUrl as String, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                var baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse,baseResponse.errormessage,issuccess)

                }else
                {
                    callback(baseResponse,"",issuccess)
                }
        }
    }
    
    
    /**List of Favorites
    *@param params Dictionary {} Empty
    *@param callback
    */
    public func getFavorites(userId:String,params:Dictionary<String,AnyObject>,callback:(Array<Favorite>,String,Bool)->Void)
    {
        let methodUrl=NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETFAVORITES,userId)

        JsapiRest.getRequest(methodUrl as String, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                var favResponse=FavoriteResponse(fromDictionary: result["result"] as! NSDictionary)
                callback(favResponse.favorites,favResponse.errormessage,issuccess)
        }
    }
    
    
    /**Delete Favorite Item
    *@param params Dictionary {"id": 0} fav item ID
    *@param callback
    */
    public func deleteFavorite(userId:String,favoriteId:String,params:Dictionary<String,AnyObject>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl=NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.DELETEFAVORITE,userId,favoriteId)

        JsapiRest.deleteRequest(methodUrl as String, deleteParams: Utilities.jsonRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                var baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse,baseResponse.errormessage,issuccess)

                }else
                {
                    callback(baseResponse,"",issuccess)
                }
        }
    }
    
    

}