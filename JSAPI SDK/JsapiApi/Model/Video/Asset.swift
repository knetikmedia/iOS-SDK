//
//	Asset.swift
//
//	Create by Youssef on 6/7/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Asset{

    public init(){}
	var deleted : Int!
	var description : String!
	var hash : String!
	var id : Int!
	var itemId : Int!
	var path : AnyObject!
	var sortOrder : Int!
	var type : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		deleted = dictionary["deleted"] as? Int
		description = dictionary["description"] as? String
		hash = dictionary["hash"] as? String
		id = dictionary["id"] as? Int
		itemId = dictionary["item_id"] as? Int
		path = dictionary["path"] as AnyObject!
		sortOrder = dictionary["sort_order"] as? Int
		type = dictionary["type"] as? String
		url = dictionary["url"] as? String
	}
  
    /**
    * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
    */
    func toDictionary() -> NSDictionary
    {
        var dictionary = NSMutableDictionary()
        if deleted != nil{
            dictionary["deleted"] = deleted
        }
        if description != nil{
            dictionary["description"] = description
        }
        if hash != nil{
            dictionary["hash"] = hash
        }
        if id != nil{
            dictionary["id"] = id
        }
        if itemId != nil{
            dictionary["item_id"] = itemId
        }
        if path != nil{
            dictionary["path"] = path
        }
        if sortOrder != nil{
            dictionary["sort_order"] = sortOrder
        }
        if type != nil{
            dictionary["type"] = type
        }
        if url != nil{
            dictionary["url"] = url
        }
        return dictionary
    }
    

}