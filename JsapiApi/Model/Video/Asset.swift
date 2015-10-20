//
//	Asset.swift
//
//	Create by Youssef on 6/7/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Asset:NSObject{

    override public init() {
        super.init()
    }
    var deleted : Int!
	var assetDescription : String!
	var assetHash : String!
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
		assetDescription = dictionary["description"] as? String
		assetHash = dictionary["hash"] as? String
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
        let dictionary = NSMutableDictionary()
        if deleted != nil{
            dictionary["deleted"] = deleted
        }
        if assetDescription != nil{
            dictionary["description"] = assetDescription
        }
        if assetHash != nil{
            dictionary["hash"] = assetHash
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