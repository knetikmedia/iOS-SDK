//
//  CategoriesService.swift
//  JsapiApi
//
//  Created by youssef on 25/11/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
public class ArticleService:NSObject
{

    /**List of Articlas
    *@param params Dictionary {} Empty
    *@param callback
    */
    public func getArticles(params:Dictionary<String,AnyObject>,callback:(ArticlePage,String,Bool)->Void)
    {
        let methodUrl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.GETARTICLES
        
        JsapiRest.sharedInstance.getRequest(methodUrl, postParams: Utilities.getGETRequestFromDictionary(params))
            {
                (result:NSDictionary,issuccess:Bool) in
                
                let articleResponse=BaseArticleResponse(fromDictionary: result)

                if(issuccess){
                    

                    callback(articleResponse.result,articleResponse.errormessage,issuccess)
                    
                }else{
                
                    callback(ArticlePage(),articleResponse.errormessage,issuccess)

                }
        }
    }
    
  
}