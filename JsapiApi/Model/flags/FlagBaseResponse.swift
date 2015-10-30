//
//	RootClass.swift
//
//	Create by Youssef on 30/10/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class FlagBaseResponse :BaseResponse{

	var content : FlagContent!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
		
        super.init(fromDictionary: dictionary)
        
        if let resultData = dictionary["result"] as? NSDictionary{
			content = FlagContent(fromDictionary: resultData)
		}else
        {
            content = FlagContent()
        }
        
	}

	
}