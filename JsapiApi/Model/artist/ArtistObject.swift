//
//	Content.swift
//
//	Create by Youssef on 26/1/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class ArtistObject :NSObject{

	open var born : String!
	open var contributionCount : NSNumber!
	open var contributions : NSDictionary!
	open var created : NSNumber!
	open var died : String!
	open var artistId : NSNumber!
	open var longDescription : String!
	open var name : String!
	open var priority : NSNumber!
	open var shortDescription : String!
	open var updated : NSNumber!
    open var assets :  [AssetContent]!
    override public init(){super.init()}


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		born = dictionary["born"] as? String
		contributionCount = dictionary["contributionCount"] as? NSNumber
        contributions = dictionary["contributions"] as? NSDictionary
		created = dictionary["created"] as? NSNumber
		died = dictionary["died"] as? String
		artistId = dictionary["id"] as? NSNumber
		longDescription = dictionary["longDescription"] as? String
		name = dictionary["name"] as? String
		priority = dictionary["priority"] as? NSNumber
		shortDescription = dictionary["shortDescription"] as? String
		updated = dictionary["updated"] as? NSNumber
        assets = [AssetContent]()
        if let assetsArray = dictionary["assets"] as? [NSDictionary]{
            for dic in assetsArray{
                let value = AssetContent(fromDictionary: dic)
                assets.append(value)
            }
        }
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if born != nil{
			dictionary["born"] = born
		}
		if contributionCount != nil{
			dictionary["contributionCount"] = contributionCount
		}
		if contributions != nil{
			dictionary["contributions"] = contributions
		}
		if created != nil{
			dictionary["created"] = created
		}
		if died != nil{
			dictionary["died"] = died
		}
		if artistId != nil{
			dictionary["id"] = artistId
		}
		if longDescription != nil{
			dictionary["longDescription"] = longDescription
		}
		if name != nil{
			dictionary["name"] = name
		}
		if priority != nil{
			dictionary["priority"] = priority
		}
		if shortDescription != nil{
			dictionary["shortDescription"] = shortDescription
		}
		if updated != nil{
			dictionary["updated"] = updated
		}
		return dictionary
	}

}
