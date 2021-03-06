//
//	RelationshipdBaseResponse.swift
//
//	Create by Youssef on 28/1/2016
//	Copyright © 2016. All rights reserved.
import Foundation

class RelationshipdBaseResponse :BaseResponse{

	var content : [RelationshipObject]!
	var first : Bool!
	var last : Bool!
	var number : Int!
	var numberOfElements : Int!
	var size : Int!
	var totalElements : Int!
	var totalPages : Int!



	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        
        super.init(fromDictionary: dictionary)
        
		content = [RelationshipObject]()
        
		if let contentArray = dictionary["content"] as? [NSDictionary]{
			for dic in contentArray{
				let value = RelationshipObject(fromDictionary: dic)
				content.append(value)
			}
		}
		first = dictionary["first"] as? Bool
		last = dictionary["last"] as? Bool
		number = dictionary["number"] as? Int
		numberOfElements = dictionary["number_of_elements"] as? Int
		size = dictionary["size"] as? Int
		totalElements = dictionary["total_elements"] as? Int
		totalPages = dictionary["total_pages"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
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
			dictionary["number_of_elements"] = numberOfElements
		}
		if size != nil{
			dictionary["size"] = size
		}
		if totalElements != nil{
			dictionary["total_elements"] = totalElements
		}
		if totalPages != nil{
			dictionary["total_pages"] = totalPages
		}
		return dictionary
	}

}
