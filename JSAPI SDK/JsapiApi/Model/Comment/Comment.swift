//
//	Comment.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Comment{

	var comment : String!
	var commentId : Int!
	var dateCreated : String!
	var dateUpdated : String!
	var deleted : Int!
	var displayName : String!
	var itemId : Int!
	var userId : Int!

    
    public func  getComment()-> String
    {
        return comment;
    }
    public func  getCommentId()-> Int{return commentId}
    public func  getDateCreated()->String{return dateCreated}
    public func  getDateUpdated()->String{return dateUpdated}
    public func  getDeleted()->Int{return deleted}
    public func  getDisplayName()->String{return displayName}
    public func  getItemId()->Int{return itemId}
    public func  getUserId()->Int{return userId}
    

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		comment = dictionary["comment"] as? String
		commentId = dictionary["comment_id"] as? Int
		dateCreated = dictionary["date_created"] as? String
		dateUpdated = dictionary["date_updated"] as? String
		deleted = dictionary["deleted"] as? Int
		displayName = dictionary["display_name"] as? String
		itemId = dictionary["item_id"] as? Int
		userId = dictionary["user_id"] as? Int
	}

}