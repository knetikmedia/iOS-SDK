//
//	AdditionalPropertie.swift
//
//	Create by Youssef on 9/3/2017
//	Copyright © 2017. All rights reserved.
import Foundation

open class ArtistAdditionalPropertie:NSObject{

	var thumbnail : ArtistAsset!
    open var battleKey : GeneralAdditionalObject!
    open var voteKey : GeneralAdditionalObject!
    open var surpiseKey : GeneralAdditionalObject!
    open var videoId : GeneralAdditionalObject!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let mainDashData = dictionary["thumbnail"] as? NSDictionary{
			thumbnail = ArtistAsset(fromDictionary: mainDashData)
		}
        if let vote_key = dictionary["vote_key"] as? NSDictionary{
            voteKey = GeneralAdditionalObject(fromDictionary: vote_key)
        }
        if let surprise_key = dictionary["surprise_key"] as? NSDictionary{
            surpiseKey = GeneralAdditionalObject(fromDictionary: surprise_key)
        }
        if let battle_key = dictionary["battle_key"] as? NSDictionary{
            battleKey = GeneralAdditionalObject(fromDictionary: battle_key)
        }
        if let video_id = dictionary["video_id"] as? NSDictionary{
            videoId = GeneralAdditionalObject(fromDictionary: video_id)
        }


			}

	

}
