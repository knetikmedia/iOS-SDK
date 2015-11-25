//
//	Result.swift
//
//	Create by Youssef on 25/11/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class CategoryPage:NSObject{

	public var content : [CategoryObject]!
	public var first : Bool!
	public var last : Bool!
	public var number : NSNumber!
	public var numberOfElements : NSNumber!
	public var size : NSNumber!
	public var sort : String!
	public var totalElements : NSNumber!
	public var totalPages : NSNumber!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		content = [CategoryObject]()
		if let contentArray = dictionary["content"] as? [NSDictionary]{
			for dic in contentArray{
				let value = CategoryObject(fromDictionary: dic)
				content.append(value)
			}
		}
		first = dictionary["first"] as? Bool
		last = dictionary["last"] as? Bool
		number = dictionary["number"] as? Int
		numberOfElements = dictionary["numberOfElements"] as? Int
		size = dictionary["size"] as? Int
		sort = dictionary["sort"] as? String
		totalElements = dictionary["totalElements"] as? Int
		totalPages = dictionary["totalPages"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if content != nil{
			var dictionaryElements = [NSDictionary]()
			for contentElement in content {
				dictionaryElements.append(contentElement.toDictionary())
			}
			dictionary["content"] = dictionaryElements
		}
		if first != nil{
			dictionary["first"] = first
		}
		if last != nil{
			dictionary["last"] = last
		}
		if number != nil{
			dictionary["number"] = number
		}
		if numberOfElements != nil{
			dictionary["numberOfElements"] = numberOfElements
		}
		if size != nil{
			dictionary["size"] = size
		}
		if sort != nil{
			dictionary["sort"] = sort
		}
		if totalElements != nil{
			dictionary["totalElements"] = totalElements
		}
		if totalPages != nil{
			dictionary["totalPages"] = totalPages
		}
		return dictionary
	}

}