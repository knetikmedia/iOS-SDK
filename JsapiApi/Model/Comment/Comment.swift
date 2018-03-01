//
//	Comment.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class Comment:NSObject{

	open var comment : String!
	open var commentId : NSNumber!
	open var dateCreated : String!
	open var dateUpdated : String!
	open var deleted : NSNumber!
	open var displayName : String!
    open var summary : String!
	open var contextId : String!
    open var context : String!
	open var userId : NSNumber!
    open var user :SimpleUser!
    
    open func  getComment()-> String
    {
        return comment;
    }
    open func  getCommentId()-> NSNumber{return commentId}
    open func  getDateCreated()->String{return dateCreated}
    open func  getDateUpdated()->String{return dateUpdated}
    open func  getDeleted()->NSNumber{return deleted}
    open func  getDisplayName()->String{return displayName}
    open func  getContextId()->String{return contextId}
    open func  getUserId()->NSNumber{return userId}
    open func  getContext()->String{return context}

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
		contextId = dictionary["context_id"] as? String
		userId = dictionary["user_id"] as? NSNumber
        user=SimpleUser(fromDictionary: dictionary["user"] as! NSDictionary)
	}

}
