//
//	AdditionalPropertie.swift
import Foundation

open class GeneralAdditionalPropertie:NSObject{

	open var donateMessage : DonateMessage!
	open var thumbnail : CategoryThumbnail!
    open var donattionUrl : DonateMessage!
    open var voteKey : GeneralAdditionalObject!
    open var surpiseKey : GeneralAdditionalObject!
    open var battleKey : GeneralAdditionalObject!
    open var videoId : GeneralAdditionalObject!
    open var videoLoop : GeneralNumber!
    open var videoPairs : GeneralNumber!



    override public init(){super.init()}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let donateMessageData = dictionary["donate_message"] as? NSDictionary{
			donateMessage = DonateMessage(fromDictionary: donateMessageData)
		}
		if let thumbnailData = dictionary["thumbnail"] as? NSDictionary{
			thumbnail = CategoryThumbnail(fromDictionary: thumbnailData)
		}
        if let donattion_url = dictionary["donation_url"] as? NSDictionary{
            donattionUrl = DonateMessage(fromDictionary: donattion_url)
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
        if let video_loop = dictionary["video_loop"] as? NSDictionary{
            videoLoop = GeneralNumber(fromDictionary: video_loop)
        }
        if let video_pairs = dictionary["video_pairs"] as? NSDictionary{
            videoPairs = GeneralNumber(fromDictionary: video_pairs)
        }
	}
}
