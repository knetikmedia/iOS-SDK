//
//	Comment.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Comment:NSObject{

	var comment : String!
	var commentId : Int!
	var dateCreated : String!
	var dateUpdated : String!
	var deleted : Int!
	var displayName : String!
    var summary : String!
	var contextId : Int!
    var context : String!
	var userId : Int!
    var user :SimpleUser!
    
    public func  getComment()-> String
    {
        return comment;
    }
    public func  getCommentId()-> Int{return commentId}
    public func  getDateCreated()->String{return dateCreated}
    public func  getDateUpdated()->String{return dateUpdated}
    public func  getDeleted()->Int{return deleted}
    public func  getDisplayName()->String{return displayName}
    public func  getContextId()->Int{return contextId}
    public func  getUserId()->Int{return userId}
    public func  getContext()->String{return context}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		comment = dictionary["content"] as? String
		commentId = dictionary["id"] as? Int
		dateCreated = dictionary["date_created"] as? String
		dateUpdated = dictionary["date_updated"] as? String
		deleted = dictionary["deleted"] as? Int
		displayName = dictionary["display_name"] as? String
        summary = dictionary["summary"] as? String
        context = dictionary["context"] as? String
		contextId = dictionary["context_id"] as? Int
		userId = dictionary["user_id"] as? Int
        user=SimpleUser(fromDictionary: dictionary["user"] as! NSDictionary)
	}

}