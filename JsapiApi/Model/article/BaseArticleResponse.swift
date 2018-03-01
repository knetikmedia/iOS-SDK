//
//	RootClass.swift
//
//	Create by Youssef on 18/3/2016
//	Copyright © 2016. All rights reserved.
import Foundation

 class BaseArticleResponse : BaseResponse{

	var cached : Bool!
	var error : Error!
	var message : String!
	var parameters : [AnyObject]!
	var requestId : String!
	var result : ArticlePage!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        
		super.init(fromDictionary: dictionary)
        
		if let resultData = dictionary as? NSDictionary{
            
			result = ArticlePage(fromDictionary: resultData)
		}
	}

	
}
