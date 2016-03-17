//
//	RootClass.swift
//
//	Create by Youssef on 17/3/2016
//	Copyright © 2016. All rights reserved.
import Foundation

class BaseVirtualItemsWithAssets:BaseResponse{

	var result : [VirtualItemResultsAssets]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        
        super.init(fromDictionary: dictionary)
        
		result = [VirtualItemResultsAssets]()
        
		if let resultArray = dictionary["result"] as? [NSDictionary]{
			for dic in resultArray{
				let value = VirtualItemResultsAssets(fromDictionary: dic)
				result.append(value)
			}
		}
	}

}