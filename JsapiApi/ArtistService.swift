//
//  VideoService.swift
//  JsapiApi
//
//  Created by youssef on 7/6/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//
/**

*/

import Foundation
public class ArtistService:NSObject
{
    
    /** Get Artist and Global Videos
    *@param params Dictionary
    *@param callback
    */
    public func getArtistList(params:Dictionary<String,AnyObject>,callback:(ArtistPage,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETARTISTS
        
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                
                if(!issuccess)
                {
                    let baseResponse=BaseArtistResponse(fromDictionary: result)

                    callback(baseResponse.result,baseResponse.errormessage,issuccess)
                    
                }else
                {
                    let baseResponse=BaseArtistResponse(fromDictionary: result)

                    callback(baseResponse.result,"",issuccess)
                    
                }
                
        }
    }

    /** Get Artist and Global Videos
     *@param params Dictionary
     *@param callback
     */
    public func getArtistDetails(artistId:String ,params:Dictionary<String,AnyObject>,callback:(ArtistObject,String,Bool)->Void)
    {
        let methodUrl:String = NSString(format: JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETARTISTDETAILS,artistId) as String
        
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
        {
            (result:NSDictionary,issuccess:Bool) in
            
            if(!issuccess)
            {
                let baseResponse=BaseArtistResponse(fromDictionary: result,withDetails: true)
                
                callback(baseResponse.artistDetails,baseResponse.errormessage,issuccess)
                
            }else
            {
                let baseResponse=BaseArtistResponse(fromDictionary: result,withDetails: true)
                
                callback(baseResponse.artistDetails,"",issuccess)
                
            }
            
        }
    }

    
}