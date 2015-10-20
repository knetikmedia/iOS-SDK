//
//	User.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class SimpleUser:NSObject{

	var id : Int!
	var displayName : String!
	var avatarUrl : String!
    
    public func getId()->Int{return id}
    public func getAvatarUrl()->String{return avatarUrl }
    public func getDisplayName()->String{return displayName }
  
        
    override public init(){super.init()}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		id = dictionary["id"] as? Int
		avatarUrl = dictionary["avatarUrl"] as? String
		displayName = dictionary["displayname"] as? String
		}

    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if id != nil{
            dictionary["id"] = id
        }
        if displayName != nil{
            dictionary["name"] = displayName
        }
        return dictionary
    }

}