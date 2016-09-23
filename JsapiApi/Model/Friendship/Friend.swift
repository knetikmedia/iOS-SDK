//
//	Friend.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class Friend:NSObject{
    
    var displayName : String!
    var userId : NSNumber!
    var userStatus : String!
    var friends : [Friend]!
    var invites : [Friend]!
    override public init(){super.init()}

    open func getFriends()->Array<Friend>
    {
        return friends;
    }
    open func getInvites()->Array<Friend>
    {
        return invites;
    }
    open func getDisplayName()->String
    {
        return displayName;
    }
    
    open func getUserId()->NSNumber
    {
        return userId;
    }

    open func getUserStatus()->String
    {
        return userStatus;
    }
    /**
    * Instantiate the instance using the passed dictionary values to set the properties values
    */
    init(fromDictionary dictionary: NSDictionary){
        displayName = dictionary["display_name"] as? String
        userId = dictionary["user_id"] as? NSNumber
        userStatus = dictionary["user_status"] as? String
        friends = [Friend]()
        if let friendsArray = dictionary["friends"] as? [NSDictionary]{
            for dic in friendsArray{
                let value = Friend(fromDictionary: dic)
                friends.append(value)
            }
        }
        invites = [Friend]()
        if let friendsArray = dictionary["invites"] as? [NSDictionary]{
            for dic in friendsArray{
                let value = Friend(fromDictionary: dic)
                invites.append(value)
            }
        }
    }
    
}
