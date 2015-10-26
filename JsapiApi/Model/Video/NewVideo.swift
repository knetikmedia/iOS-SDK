//
//	Result.swift
//
//	Create by Youssef on 7/7/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class NewVideo:NSObject{

    override public init(){}
	public var created : NSNumber!
	public var deleted : Bool!
	public var deletedAt : AnyObject!
	public var videodescription : String!
	public var displayable : Bool!
	public var fileName : String!
	public var newVideoId : NSNumber!
	public var itemAssets : AnyObject!
	public var longDescription : AnyObject!
	public var name : AnyObject!
	public var shortDescription : AnyObject!
	public var title : String!
	public var updated : NSNumber!

    public func getDisplayable()->Bool{
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