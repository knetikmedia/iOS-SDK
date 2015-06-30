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
    public func addFavoriteItem(params:Dictionary<String,AnyObject>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDFAVORITE;
        JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
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
    public func getFavorites(params:Dictionary<String,AnyObject>,callback:(Array<Favorite>,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETFAVORITES;
        JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                var favResponse=FavoriteResponse(fromDictionary: result)
                callback(favResponse.favorites,favResponse.errormessage,issuccess)
        }
    }
    
    
    /**Delete Favorite Item
    *@param params Dictionary {"id": 0} fav item ID
    *@param callback
    */
    public func deleteFavorite(params:Dictionary<String,AnyObject>,callback:(AnyObject,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.DELETEFAVORITE;
        JsapiRest.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
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