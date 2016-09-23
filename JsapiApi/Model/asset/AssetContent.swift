//
//	Content.swift
//
//	Create by Youssef on 23/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class AssetContent : NSObject {

	open var data : NSDictionary!
	open var displayName : String!
	open var qualifier : String!
	open var type : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
        
		data = dictionary["data"] as? NSDictionary
        
        displayName = dictionary["display_name"] as? String
        
		qualifier = dictionary["qualifier"] as? String
        
		type = dictionary["type"] as? String
	}

	
}
