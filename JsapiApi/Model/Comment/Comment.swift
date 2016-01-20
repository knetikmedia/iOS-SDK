//
//	Comment.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Comment:NSObject{

	public var comment : String!
	public var commentId : NSNumber!
	public var dateCreated : String!
	public var dateUpdated : String!
	public var deleted : NSNumber!
	public var displayName : String!
    public var summary : String!
	public var contextId : NSNumber!
    public var context : String!
	public var userId : NSNumber!
    public var user :SimpleUser!
    
    public func  getComment()-> String
    {
        return comment;
    }
    public func  getCommentId()-> NSNumber{return commentId}
    public func  getDateCreated()->String{return dateCreated}
    public func  getDateUpdated()->String{return dateUpdated}
    public func  getDeleted()->NSNumber{return deleted}
    public func  getDisplayName()->String{return displayName}
    public func  getContextId()->NSNumber{return contextId}
    public func  getUserId()->NSNumber{return userId}
    public func  getContext()->String{return context}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		comment = dictionary["content"] as? String
		commentId = dictionary["id"] as? NSNumber
		dateCreated = dictionary["date_created"] as? String
		dateUpdated = dictionary["date_updated"] as? String
		deleted = dictionary["deleted"] as? NSNumber
		displayName = dictionary["display_name"] as? String
        summary = dictionary["summary"] as? String
        context = dictionary["context"] as? String
		contextId = dictionary["context_id"] as? NSNumber
		userId = dictionary["user_id"] as? NSNumber
        user=SimpleUser(fromDictionary: dictionary["user"] as! NSDictionary)
	}

}