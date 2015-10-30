//
//	Result.swift
//
//	Create by Youssef on 30/10/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class FlagContent :NSObject{

	var content : [Flag]!
	var first : Bool!
	var last : Bool!
	var number : NSNumber!
	var numberOfElements : NSNumber!
	var size : NSNumber!
	var sort : String!
	var totalElements : NSNumber!
	var totalPages : NSNumber!

    override init() {
        
        content = [Flag]()
    }

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
        
        
		content = [Flag]()
		if let contentArray = dictionary["content"] as? [NSDictionary]{
			for dic in contentArray{
				let value = Flag(fromDictionary: dic)
				content.append(value)
			}
		}
		first = dictionary["first"] as? Bool
		last = dictionary["last"] as? Bool
		number = dictionary["number"] as? NSNumber
		numberOfElements = dictionary["numberOfElements"] as? NSNumber
		size = dictionary["size"] as? NSNumber
		totalElements = dictionary["totalElements"] as? NSNumber
		totalPages = dictionary["totalPages"] as? NSNumber
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