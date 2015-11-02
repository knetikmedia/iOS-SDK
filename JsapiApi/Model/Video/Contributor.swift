//
//	Contributor.swift
//
//	Create by Youssef on 25/8/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Contributor :NSObject{

	public var artist : Artist!
	public var media : Artist!
	public var role : String!


    override public init(){super.init()}

    
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let artistData = dictionary["artist"] as? NSDictionary{
			artist = Artist(fromDictionary: artistData)
		}
		if let mediaData = dictionary["media"] as? NSDictionary{
			media = Artist(fromDictionary: mediaData)
		}
		role = dictionary["role"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	public func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if artist != nil{
			dictionary["artist"] = artist.toDictionary()
		}
		if media != nil{
			dictionary["media"] = media.toDictionary()
		}
		if role != nil{
			dictionary["role"] = role
		}
		return dictionary
	}

}