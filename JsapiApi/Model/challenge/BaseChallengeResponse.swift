//
//	RootClass.swift
//
//	Create by Youssef on 22/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

class BaseChallengeResponse:BaseResponse{

	var result : ChallengesPage!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        
		super.init(fromDictionary: dictionary)
        
        if let resultData = dictionary["result"] as? NSDictionary{
			result = ChallengesPage(fromDictionary: resultData)
            
        }else{
        
            result = ChallengesPage();
        }
	}

	
}