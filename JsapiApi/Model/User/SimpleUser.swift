//
//	User.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class SimpleUser:NSObject{

	public var userId : Int!
	public var displayName : String!
	public  var avatarUrl : String!
    
    public func getId()->Int{return userId}
    public func getAvatarUrl()->String{return avatarUrl }
    public func getDisplayName()->String{return displayName }
  
        
    override public init(){super.init()}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		userId = dictionary["id"] as? Int
		avatarUrl = dictionary["avatarUrl"] as? String
		displayName = dictionary["displayname"] as? String
		}

    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if userId != nil{
            dictionary["id"] = userId
        }
        if displayName != nil{
            dictionary["name"] = displayName
        }
        return dictionary
    }

}