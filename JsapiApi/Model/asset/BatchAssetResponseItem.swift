//
//	Body.swift
//
//	Create by Youssef on 23/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class BatchAssetResponseItem : NSObject{

    open var result : BatchAssetPage!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
	  
		if let resultData = dictionary as? NSDictionary{
            
			result = BatchAssetPage(fromDictionary: resultData)
		}
	}


}
