//
//	Artist.swift
//
//	Create by Youssef on 25/8/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Artist :NSObject{

    public var artistId : NSNumber!
	public var name : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		artistId = dictionary["id"] as? NSNumber
		name = dictionary["name"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if artistId != nil{
			dictionary["id"] = artistId
		}
		if name != nil{
			dictionary["name"] = name
		}
		return dictionary
	}

}