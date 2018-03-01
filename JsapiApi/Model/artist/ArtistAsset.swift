//
//	MainDash.swift
//
//	Create by Youssef on 9/3/2017
//	Copyright © 2017. All rights reserved.
import Foundation

open class ArtistAsset:NSObject{

	var crc : AnyObject!
	var maindescription : String!
	var fileType : String!
	var type : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		crc = dictionary["crc"] as? AnyObject
		maindescription = dictionary["description"] as? String
		fileType = dictionary["file_type"] as? String
		type = dictionary["type"] as? String
		url = dictionary["url"] as? String
	}

	
}
