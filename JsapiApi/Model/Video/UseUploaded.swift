//
//	UseUploaded.swift
//
//	Create by Youssef on 6/7/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class UseUploaded:NSObject{

	public var uploadId : NSNumber!
	public var itemId : NSNumber!
	public var userId : NSNumber!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		uploadId = dictionary["id"] as? NSNumber
		itemId = dictionary["item_id"] as? NSNumber
		userId = dictionary["user_id"] as? NSNumber
	}

}