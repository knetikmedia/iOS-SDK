//
//	RootClass.swift
//
//	Create by Youssef on 17/3/2016
//	Copyright © 2016. All rights reserved.
import Foundation

class BaseVirtualItem:BaseResponse{

	
	var result : VirtualItemPage!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
		
        super.init(fromDictionary: dictionary)
        
		if let resultData = dictionary as? NSDictionary{
            
			result = VirtualItemPage(fromDictionary: resultData)
            
        }else{
        
            result = VirtualItemPage()

        }
	}

}
