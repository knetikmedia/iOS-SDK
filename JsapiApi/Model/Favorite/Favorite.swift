//
//	Favorite.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class Favorite:NSObject{

	open var _id : NSNumber!
	open var address : AnyObject!
	open var address2 : AnyObject!
	open var affiliateId : AnyObject!
	open var assets : [AnyObject]!
	open var avatarUrl : AnyObject!
	open var behaviors : [AnyObject]!
	open var city : AnyObject!
	open var countryId : AnyObject!
	open var currency : AnyObject!
	open var dateCreated : NSNumber!
	open var dateOfBirth : AnyObject!
	open var dateUpdated : NSNumber!
	open var deleted : NSNumber!
	open var deletedAt : AnyObject!
	open var favoriteDescription : AnyObject!
	open var displayName : String!
	open var email : String!
	open var firstName : AnyObject!
	open var fullname : String!
	open var gender : AnyObject!
	open var id : NSNumber!
	open var lang : AnyObject!
	open var lastActivity : NSNumber!
	open var lastLogin : NSNumber!
	open var lastName : AnyObject!
	open var lockoutAttempts : AnyObject!
	open var lockoutDate : AnyObject!
	open var longDescription : String!
	open var mobileNumber : AnyObject!
	open var name : String!
	open var oldId : AnyObject!
	open var password : String!
	open var postalCode : AnyObject!
	open var related : [AnyObject]!
	open var shortDescription : String!
	open var skus : [AnyObject]!
	open var sort : NSNumber!
	open var state : AnyObject!
	open var status : String!
	open var terms : [AnyObject]!
	open var timezoneId : AnyObject!
	open var token : AnyObject!
	open var typeHNSNumber : String!
	open var uniqueKey : String!
	open var username : String!


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
				assets.append(value as AnyObject)
			}
		}
		avatarUrl = dictionary["avatar_url"] as AnyObject!
		behaviors = [AnyObject]()
		if let behaviorsArray = dictionary["behaviors"] as? [String]{
			for dic in behaviorsArray{
				let value = dic
				behaviors.append(value as AnyObject)
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
				related.append(value as AnyObject)
			}
		}
		shortDescription = dictionary["short_description"] as? String
		skus = [AnyObject]()
		if let skusArray = dictionary["skus"] as? [String]{
			for dic in skusArray{
				let value = dic
				skus.append(value as AnyObject)
			}
		}
		sort = dictionary["sort"] as? NSNumber
		state = dictionary["state"] as AnyObject!
		status = dictionary["status"] as? String
		terms = [AnyObject]()
		if let termsArray = dictionary["terms"] as? [String]{
			for dic in termsArray{
				let value = dic
				terms.append(value as AnyObject)
			}
		}
		timezoneId = dictionary["timezone_id"] as AnyObject!
		token = dictionary["token"] as AnyObject!
		typeHNSNumber = dictionary["type_hNSNumber"] as? String
		uniqueKey = dictionary["unique_key"] as? String
		username = dictionary["username"] as? String
	}

}
