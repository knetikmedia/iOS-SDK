//
//  Favorite.swift
//  JsapiApi
//
//  Created by youssef on 4/2/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
open class FavoriteService:NSObject
{

    /** add Favorite Item
    *@param params Dictionary{"id": 0} // ItemID
    *@param callback
    */
    open func addFavoriteItem(_ params:Dictionary<String,AnyObject>,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.ADDFAVORITE;
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=BaseResponse(fromDictionary: result)
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
    open func getFavorites(_ params:Dictionary<String,AnyObject>,callback:@escaping (Array<Favorite>,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETFAVORITES;
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let favResponse=FavoriteResponse(fromDictionary: result)
                callback(favResponse.favorites,favResponse.errormessage,issuccess)
        }
    }
    
    
    /**Delete Favorite Item
    *@param params Dictionary {"id": 0} fav item ID
    *@param callback
    */
    open func deleteFavorite(_ params:Dictionary<String,AnyObject>,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.DELETEFAVORITE;
        JsapiRest.sharedInstance.postrequest(methodUrl, postParams: Utilities.jsonRequestFromDictionary(params), isJson: true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=BaseResponse(fromDictionary: result)
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
