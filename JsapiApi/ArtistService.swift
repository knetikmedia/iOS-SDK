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
open class ArtistService:NSObject
{
    
    /** Get Artist and Global Videos
    params Dictionary
    callback
    */
    open func getArtistList(_ params:Dictionary<String,AnyObject>,callback:@escaping (ArtistPage,String,Bool)->Void)
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
      params Dictionary
      callback
     */
    open func getArtistDetails(_ artistId:String ,params:Dictionary<String,AnyObject>,callback:@escaping (ArtistObject,String,Bool)->Void)
    {
        let url = JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETARTISTDETAILS
        let methodUrl:String = NSString(format: url as NSString ,artistId) as String
        
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
