//
//	Friend.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Friend{
    
    var displayName : String!
    var userId : Int!
    var userStatus : String!
    var friends : [Friend]!
    var invites : [Friend]!
    public init(){}

    public func getFriends()->Array<Friend>
    {
        return friends;
    }
    public func getInvites()->Array<Friend>
    {
        return invites;
    }
    public func getDisplayName()->String
    {
        return userStatus;
    }
    
    public func getUserId()->Int
    {
        return userId;
    }

    public func getUserStatus()->String
    {
        return userStatus;
    }
    /**
    * Instantiate the instance using the passed dictionary values to set the properties values
    */
    init(fromDictionary dictionary: NSDictionary){
        displayName = dictionary["display_name"] as? String
        userId = dictionary["user_id"] as? Int
        userStatus = dictionary["user_status"] as? String
        friends = [Friend]()
        if let friendsArray = dictionary["content"] as? [NSDictionary]{
            for dic in friendsArray{
                let value = Friend(fromDictionary: dic)
                friends.append(value)
            }
        }
//        invites = [Friend]()
//        if let friendsArray = dictionary["invites"] as? [NSDictionary]{
//            for dic in friendsArray{
//                let value = Friend(fromDictionary: dic)
//                invites.append(value)
//            }
//        }
    }
    
    
    
}