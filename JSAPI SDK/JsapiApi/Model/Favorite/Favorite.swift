//
//	Favorite.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Favorite{

	var _id : Int!
	var address : AnyObject!
	var address2 : AnyObject!
	var affiliateId : AnyObject!
	var assets : [AnyObject]!
	var avatarUrl : AnyObject!
	var behaviors : [AnyObject]!
	var city : AnyObject!
	var countryId : AnyObject!
	var currency : AnyObject!
	var dateCreated : Int!
	var dateOfBirth : AnyObject!
	var dateUpdated : Int!
	var deleted : Int!
	var deletedAt : AnyObject!
	var description : AnyObject!
	var displayName : String!
	var email : String!
	var firstName : AnyObject!
	var fullname : String!
	var gender : AnyObject!
	var id : Int!
	var lang : AnyObject!
	var lastActivity : Int!
	var lastLogin : Int!
	var lastName : AnyObject!
	var lockoutAttempts : AnyObject!
	var lockoutDate : AnyObject!
	var longDescription : String!
	var mobileNumber : AnyObject!
	var name : String!
	var oldId : AnyObject!
	var password : String!
	var postalCode : AnyObject!
	var related : [AnyObject]!
	var shortDescription : String!
	var skus : [AnyObject]!
	var sort : Int!
	var state : AnyObject!
	var status : String!
	var terms : [AnyObject]!
	var timezoneId : AnyObject!
	var token : AnyObject!
	var typeHint : String!
	var uniqueKey : String!
	var username : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		_id = dictionary["_id"] as? Int
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
		dateCreated = dictionary["date_created"] as? Int
		dateOfBirth = dictionary["date_of_birth"] as AnyObject!
		dateUpdated = dictionary["date_updated"] as? Int
		deleted = dictionary["deleted"] as? Int
		deletedAt = dictionary["deleted_at"] as AnyObject!
		description = dictionary["description"] as AnyObject!
		displayName = dictionary["display_name"] as? String
		email = dictionary["email"] as? String
		firstName = dictionary["first_name"] as AnyObject!
		fullname = dictionary["fullname"] as? String
		gender = dictionary["gender"] as AnyObject!
		id = dictionary["id"] as? Int
		lang = dictionary["lang"] as AnyObject!
		lastActivity = dictionary["last_activity"] as? Int
		lastLogin = dictionary["last_login"] as? Int
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
		sort = dictionary["sort"] as? Int
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
		typeHint = dictionary["type_hint"] as? String
		uniqueKey = dictionary["unique_key"] as? String
		username = dictionary["username"] as? String
	}

}