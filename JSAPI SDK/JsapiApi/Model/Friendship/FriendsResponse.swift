//
//	FriendsResponse.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class FriendsResponse:BaseResponse{
    
    var friends : Friend!
    var invitedFriends : Friend!

    /**
    * Instantiate the instance using the passed dictionary values to set the properties values
    */
    override init(fromDictionary dictionary: NSDictionary)
    {
        super.init(fromDictionary: dictionary)
      if let friendsData = dictionary["friends"] as? NSDictionary{
            friends = Friend(fromDictionary: friendsData)
        }
        
        if let friendsData = dictionary["invites"] as? NSDictionary{
            invitedFriends = Friend(fromDictionary: friendsData)
        }

    }
    
}