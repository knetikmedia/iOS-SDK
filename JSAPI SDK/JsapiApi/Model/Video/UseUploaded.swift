//
//	UseUploaded.swift
//
//	Create by Youssef on 6/7/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class UseUploaded{

	var id : Int!
	var itemId : Int!
	var userId : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		id = dictionary["id"] as? Int
		itemId = dictionary["item_id"] as? Int
		userId = dictionary["user_id"] as? Int
	}

}