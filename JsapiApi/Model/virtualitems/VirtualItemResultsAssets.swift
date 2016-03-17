//
//	Result.swift
//
//	Create by Youssef on 17/3/2016
//	Copyright © 2016. All rights reserved.
import Foundation

public class VirtualItemResultsAssets :NSObject{
	
    public var item : VirtualItem!

    
    override public init(){super.init()
    
        item = VirtualItem()
    }

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){

        if let bodyData = dictionary["body"] as? NSDictionary{
            
            if let resultData = bodyData["result"] as? NSDictionary{
                
			item = VirtualItem(fromDictionary: resultData)
        }
		}
	}

}