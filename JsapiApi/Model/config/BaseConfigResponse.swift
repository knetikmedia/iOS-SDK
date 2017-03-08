//
//	RootClass.swift
//
//	Create by Youssef on 24/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

class BaseConfigResponse :BaseResponse{


	var result : Config!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
		
        super.init(fromDictionary: dictionary)
        
        if let resultData = dictionary as? NSDictionary{
            
			result = Config(fromDictionary: resultData)
            
		}
	}

	
}
