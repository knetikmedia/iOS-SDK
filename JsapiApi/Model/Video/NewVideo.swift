//
//	Result.swift
//
//	Create by Youssef on 7/7/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class NewVideo:NSObject{

    override public init(){}
	open var created : NSNumber!
	open var deleted : Bool!
	open var deletedAt : AnyObject!
	open var videodescription : String!
	open var displayable : Bool!
	open var fileName : String!
	open var newVideoId : NSNumber!
	open var itemAssets : AnyObject!
	open var longDescription : AnyObject!
	open var name : AnyObject!
	open var shortDescription : AnyObject!
	open var title : String!
	open var updated : NSNumber!

    open func getDisplayable()->Bool{
        return displayable;
    }
    
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		created = dictionary["created"] as? NSNumber
		deleted = dictionary["deleted"] as? Bool
		deletedAt = dictionary["deletedAt"] as AnyObject!
		videodescription = dictionary["description"] as? String
		displayable = dictionary["displayable"] as? Bool
		fileName = dictionary["fileName"] as? String
		newVideoId = dictionary["id"] as? NSNumber
		itemAssets = dictionary["item_assets"] as AnyObject!
		longDescription = dictionary["longDescription"] as AnyObject!
		name = dictionary["name"] as AnyObject!
		shortDescription = dictionary["shortDescription"] as AnyObject!
		title = dictionary["title"] as? String
		updated = dictionary["updated"] as? NSNumber
	}


}
