//
//	Result.swift
//
//	Create by Youssef on 7/7/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class NewVideo:NSObject{

    override public init(){}
	var created : Int!
	var deleted : Bool!
	var deletedAt : AnyObject!
	var videodescription : String!
	var displayable : Bool!
	var fileName : String!
	var id : Int!
	var itemAssets : AnyObject!
	var longDescription : AnyObject!
	var name : AnyObject!
	var shortDescription : AnyObject!
	var title : String!
	var updated : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		created = dictionary["created"] as? Int
		deleted = dictionary["deleted"] as? Bool
		deletedAt = dictionary["deletedAt"] as AnyObject!
		videodescription = dictionary["description"] as? String
		displayable = dictionary["displayable"] as? Bool
		fileName = dictionary["fileName"] as? String
		id = dictionary["id"] as? Int
		itemAssets = dictionary["item_assets"] as AnyObject!
		longDescription = dictionary["longDescription"] as AnyObject!
		name = dictionary["name"] as AnyObject!
		shortDescription = dictionary["shortDescription"] as AnyObject!
		title = dictionary["title"] as? String
		updated = dictionary["updated"] as? Int
	}


}