//
//	Content.swift
//
//	Create by Youssef on 25/11/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class CategoryObject:NSObject{

	var active : Bool!
	public var assets : [NSDictionary]!
	public var categoryId : String!
	public var name : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		active = dictionary["active"] as? Bool
		assets = [NSDictionary]()
		if let assetsArray = dictionary["assets"] as? [NSDictionary]{
			for dic in assetsArray{
				assets.append(dic)
			}
		}
		categoryId = dictionary["id"] as? String
		name = dictionary["name"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if active != nil{
			dictionary["active"] = active
		}
		if assets != nil{
			var dictionaryElements = [NSDictionary]()
			for assetsElement in assets {
				dictionaryElements.append(assetsElement)
			}
			dictionary["assets"] = dictionaryElements
		}
		if categoryId != nil{
			dictionary["id"] = categoryId
		}
		if name != nil{
			dictionary["name"] = name
		}
		return dictionary
	}

}