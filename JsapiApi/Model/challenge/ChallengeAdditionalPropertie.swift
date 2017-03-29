//
//	AdditionalPropertie.swift
//
//	Create by Youssef on 9/3/2017
//	Copyright © 2017. All rights reserved.
import Foundation

open class ChallengeAdditionalPropertie:NSObject{

	open var mainDash : ChallengeAsset!
	open var sponsorImage : ChallengeAsset!
    open var prmotionText : NSDictionary!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let mainDashData = dictionary["MainDash"] as? NSDictionary{
			mainDash = ChallengeAsset(fromDictionary: mainDashData)
		}
		if let sponsorImageData = dictionary["Sponsor Image"] as? NSDictionary{
			sponsorImage = ChallengeAsset(fromDictionary: sponsorImageData)
		}
        
        if(sponsorImage == nil){
        if let sponsorImageData = dictionary["Sponsor_Image"] as? NSDictionary{
            sponsorImage = ChallengeAsset(fromDictionary: sponsorImageData)
        }
        }
        
        if(sponsorImage == nil){
            if let sponsorImageData = dictionary["SponsorImage"] as? NSDictionary{
                sponsorImage = ChallengeAsset(fromDictionary: sponsorImageData)
            }
        }
        
            if let prmotionTextData = dictionary["PromotionalText"] as? NSDictionary{
                prmotionText = prmotionTextData
            }
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if mainDash != nil{
			dictionary["MainDash"] = mainDash.toDictionary()
		}
		if sponsorImage != nil{
			dictionary["SponsorImage"] = sponsorImage.toDictionary()
		}
		return dictionary
	}

}
