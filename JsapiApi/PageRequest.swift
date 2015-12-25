//
//	PageRequest.swift
//
//	Create by Youssef on 22/12/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class PageRequest :NSObject{

	public var first : NSNumber!
	public var last : NSNumber!
	public var number : NSNumber!
	public var numberOfElements : NSNumber!
	public var size : NSNumber!
	public var totalElements : NSNumber!
	public var totalPages : NSNumber!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		first = dictionary["first"] as? NSNumber
		last = dictionary["last"] as? NSNumber
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
		if totalElements != nil{
			dictionary["totalElements"] = totalElements
		}
		if totalPages != nil{
			dictionary["totalPages"] = totalPages
		}
		return dictionary
	}

}