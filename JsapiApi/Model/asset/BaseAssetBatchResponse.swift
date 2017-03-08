//
//	RootClass.swift
//
//	Create by Youssef on 23/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

class BaseAssetBatchResponse :BaseResponse{

	var result : [BatchAssetPage]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        
        super.init(fromDictionary: dictionary)
        
        result = [BatchAssetPage]()
        
		if let resultArray = dictionary as? [NSDictionary]{
            
			for dic in resultArray{
                
				let value = BatchAssetPage(fromDictionary: dic)
                
				result.append(value)
                
			}
		}
	}

}
