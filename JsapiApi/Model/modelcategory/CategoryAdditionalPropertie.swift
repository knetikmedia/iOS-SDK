//
//	AdditionalPropertie.swift
import Foundation

open class CategoryAdditionalPropertie:NSObject{

	open var donateMessage : DonateMessage!
	open var thumbnail : CategoryThumbnail!
    open var donattionUrl : DonateMessage!

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
	}
}
