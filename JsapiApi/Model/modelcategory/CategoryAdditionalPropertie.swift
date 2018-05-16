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
    open var videoId1 : GeneralNumber!
    open var videoId2 : GeneralNumber!
    open var videoId3 : GeneralNumber!
    open var videoId4 : GeneralNumber!
    open var surpriseVideos : GeneralAdditionalObject!
    open var totalVideos : GeneralNumber!
    open var goldLocked : GeneralNumber!
    open var itemId : GeneralNumber!
    open var superItemId : GeneralNumber!
    open var purchaseHeader : GeneralMessage!
    open var categoryItems : GeneralMessage!




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
        if let surprise_key = dictionary["enable_surprise"] as? NSDictionary{
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
        if let video_pairs = dictionary["enable_surprise"] as? NSDictionary{
            surpriseVideos = GeneralAdditionalObject(fromDictionary: video_pairs)
        }
        if let video_id1 = dictionary["video_id1"] as? NSDictionary{
            videoId1 = GeneralNumber(fromDictionary: video_id1)
        }
        if let video_id2 = dictionary["video_id2"] as? NSDictionary{
            videoId2 = GeneralNumber(fromDictionary: video_id2)
        }
        if let video_id3 = dictionary["video_id3"] as? NSDictionary{
            videoId3 = GeneralNumber(fromDictionary: video_id3)
        }
        if let video_id4 = dictionary["video_id4"] as? NSDictionary{
            videoId4 = GeneralNumber(fromDictionary: video_id4)
        }
        if let total_videos = dictionary["artist_videos"] as? NSDictionary{
            totalVideos = GeneralNumber(fromDictionary: total_videos)
        }
        if let gold_locked = dictionary["gold_locked"] as? NSDictionary{
            goldLocked = GeneralNumber(fromDictionary: gold_locked)
        }
        if let item_id = dictionary["item_id"] as? NSDictionary{
            itemId = GeneralNumber(fromDictionary: item_id)
        }
        if let super_item_id = dictionary["super_item_id"] as? NSDictionary{
            superItemId = GeneralNumber(fromDictionary: super_item_id)
        }
        if let purchase_header = dictionary["purchase_header"] as? NSDictionary{
            purchaseHeader = GeneralMessage(fromDictionary: purchase_header)
        }

        if let category_items = dictionary["category_items"] as? NSDictionary{
            categoryItems = GeneralMessage(fromDictionary: category_items)
        }

	}
}
