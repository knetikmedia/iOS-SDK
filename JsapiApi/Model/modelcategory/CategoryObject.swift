//
//	Content.swift
//
//	Create by Youssef on 25/11/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class CategoryObject:BaseResponse{

	open var active : Bool!
	open var categoryId : String!
	open var name : String!
    open var categoryitionalProperties : GeneralAdditionalPropertie!

    override public init(){super.init()}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
		active = dictionary["active"] as? Bool
		categoryId = dictionary["id"] as? String
		name = dictionary["name"] as? String
        if let additionalPropertiesData = dictionary["additional_properties"] as? NSDictionary{
            categoryitionalProperties = GeneralAdditionalPropertie(fromDictionary: additionalPropertiesData)
        }else{
            
            categoryitionalProperties = GeneralAdditionalPropertie()
        }
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if active != nil{
			dictionary["active"] = active
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
