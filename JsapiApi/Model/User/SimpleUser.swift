//
//	User.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class SimpleUser:NSObject{

	open var userId : NSNumber!
	open var displayName : String!
	open  var avatarUrl : String!
    open  var name : String!
    open var username: String!
    open func getId()->NSNumber{return userId}
    open func getAvatarUrl()->String{return avatarUrl }
    open func getDisplayName()->String{return displayName }

        
    override public init(){super.init()}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		userId = dictionary["id"] as? NSNumber
		avatarUrl = dictionary["avatarUrl"] as? String
        
        if(avatarUrl == nil )
        {
         avatarUrl = dictionary["avatar_url"] as? String
        }

        if(username == nil )
        {
            username = dictionary["username"] as? String
        }
        
		displayName = dictionary["display_name"] as? String
        
        name = dictionary["name"] as? String
        
        if(name == nil)
        {
            if(displayName != nil){
                
            name = displayName;
                
            }
        }

		}

    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if userId != nil{
            dictionary["id"] = userId
        }
        if displayName != nil{
            dictionary["display_name"] = displayName
        }
        
        if name != nil{
            dictionary["name"] = displayName
        }
        
        return dictionary
    }

}
