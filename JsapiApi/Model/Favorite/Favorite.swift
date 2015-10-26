//
//	Favorite.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Favorite:NSObject{

	public var _id : NSNumber!
	public var address : AnyObject!
	public var address2 : AnyObject!
	public var affiliateId : AnyObject!
	public var assets : [AnyObject]!
	public var avatarUrl : AnyObject!
	public var behaviors : [AnyObject]!
	public var city : AnyObject!
	public var countryId : AnyObject!
	public var currency : AnyObject!
	public var dateCreated : NSNumber!
	public var dateOfBirth : AnyObject!
	public var dateUpdated : NSNumber!
	public var deleted : NSNumber!
	public var deletedAt : AnyObject!
	public var favoriteDescription : AnyObject!
	public var displayName : String!
	public var email : String!
	public var firstName : AnyObject!
	public var fullname : String!
	public var gender : AnyObject!
	public var id : NSNumber!
	public var lang : AnyObject!
	public var lastActivity : NSNumber!
	public var lastLogin : NSNumber!
	public var lastName : AnyObject!
	public var lockoutAttempts : AnyObject!
	public var lockoutDate : AnyObject!
	public var longDescription : String!
	public var mobileNumber : AnyObject!
	public var name : String!
	public var oldId : AnyObject!
	public var password : String!
	public var postalCode : AnyObject!
	public var related : [AnyObject]!
	public var shortDescription : String!
	public var skus : [AnyObject]!
	public var sort : NSNumber!
	public var state : AnyObject!
	public var status : String!
	public var terms : [AnyObject]!
	public var timezoneId : AnyObject!
	public var token : AnyObject!
	public var typeHNSNumber : String!
	public var uniqueKey : String!
	public var username : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		_id = dictionary["_id"] as? NSNumber
		address = dictionary["address"] as AnyObject!
		address2 = dictionary["address2"] as AnyObject!
		affiliateId = dictionary["affiliate_id"] as AnyObject!
		assets = [AnyObject]()
		if let assetsArray = dictionary["assets"] as? [String]{
			for dic in assetsArray{
				let value = dic
				assets.append(value)
			}
		}
		avatarUrl = dictionary["avatar_url"] as AnyObject!
		behaviors = [AnyObject]()
		if let behaviorsArray = dictionary["behaviors"] as? [String]{
			for dic in behaviorsArray{
				let value = dic
				behaviors.append(value)
			}
		}
		city = dictionary["city"] as AnyObject!
		countryId = dictionary["country_id"] as AnyObject!
		currency = dictionary["currency"] as AnyObject!
		dateCreated = dictionary["date_created"] as? NSNumber
		dateOfBirth = dictionary["date_of_birth"] as AnyObject!
		dateUpdated = dictionary["date_updated"] as? NSNumber
		deleted = dictionary["deleted"] as? NSNumber
		deletedAt = dictionary["deleted_at"] as AnyObject!
		favoriteDescription = dictionary["description"] as AnyObject!
		displayName = dictionary["display_name"] as? String
		email = dictionary["email"] as? String
		firstName = dictionary["first_name"] as AnyObject!
		fullname = dictionary["fullname"] as? String
		gender = dictionary["gender"] as AnyObject!
		id = dictionary["id"] as? NSNumber
		lang = dictionary["lang"] as AnyObject!
		lastActivity = dictionary["last_activity"] as? NSNumber
		lastLogin = dictionary["last_login"] as? NSNumber
		lastName = dictionary["last_name"] as AnyObject!
		lockoutAttempts = dictionary["lockout_attempts"] as AnyObject!
		lockoutDate = dictionary["lockout_date"] as AnyObject!
		longDescription = dictionary["long_description"] as? String
		mobileNumber = dictionary["mobile_number"] as AnyObject!
		name = dictionary["name"] as? String
		oldId = dictionary["old_id"] as AnyObject!
		password = dictionary["password"] as? String
		postalCode = dictionary["postal_code"] as AnyObject!
		related = [AnyObject]()
		if let relatedArray = dictionary["related"] as? [String]{
			for dic in relatedArray{
				let value = dic
				related.append(value)
			}
		}
		shortDescription = dictionary["short_description"] as? String
		skus = [AnyObject]()
		if let skusArray = dictionary["skus"] as? [String]{
			for dic in skusArray{
				let value = dic
				skus.append(value)
			}
		}
		sort = dictionary["sort"] as? NSNumber
		state = dictionary["state"] as AnyObject!
		status = dictionary["status"] as? String
		terms = [AnyObject]()
		if let termsArray = dictionary["terms"] as? [String]{
			for dic in termsArray{
				let value = dic
				terms.append(value)
			}
		}
		timezoneId = dictionary["timezone_id"] as AnyObject!
		token = dictionary["token"] as AnyObject!
		typeHNSNumber = dictionary["type_hNSNumber"] as? String
		uniqueKey = dictionary["unique_key"] as? String
		username = dictionary["username"] as? String
	}

}