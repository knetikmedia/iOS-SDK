//
//	StrategiesResponse.swift
//
//	Create by Youssef on 14/9/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class StrategiesResponse{

	var cached : Bool!
	var error : Error!
	var message : String!
	var parameters : [AnyObject]!
	var requestId : String!
	var result : [String]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		cached = dictionary["cached"] as? Bool
		if let errorData = dictionary["error"] as? NSDictionary{
			error = Error(fromDictionary: errorData)
		}
		message = dictionary["message"] as? String
		parameters = [AnyObject]()
		if let parametersArray = dictionary["parameters"] as? [NSDictionary]{
			for dic in parametersArray{
				let value = AnyObject(fromDictionary: dic)
				parameters.append(value)
			}
		}
		requestId = dictionary["requestId"] as? String
		result = dictionary["result"] as? [String]
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if cached != nil{
			dictionary["cached"] = cached
		}
		if error != nil{
			dictionary["error"] = error.toDictionary()
		}
		if message != nil{
			dictionary["message"] = message
		}
		if parameters != nil{
			var dictionaryElements = [NSDictionary]()
			for parametersElement in parameters {
				dictionaryElements.append(parametersElement.toDictionary())
			}
			dictionary["parameters"] = dictionaryElements
		}
		if requestId != nil{
			dictionary["requestId"] = requestId
		}
		if result != nil{
			dictionary["result"] = result
		}
		return dictionary
	}

}