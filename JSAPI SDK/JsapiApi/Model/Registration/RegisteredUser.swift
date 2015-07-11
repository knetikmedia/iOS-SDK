//
//	RegisteredUser.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class RegisteredUser:NSObject{
    
    var address : AnyObject!
    var address2 : AnyObject!
    var affiliateId : AnyObject!
    var avatarUrl : AnyObject!
    var city : AnyObject!
    var countryId : Int!
    var currency : Int!
    var dateOfBirth : AnyObject!
    var userDescription : AnyObject!
    var displayName : AnyObject!
    var email : String!
    var firstName : AnyObject!
    var fullname : String!
    var gender : String!
    var id : Int!
    var lang : AnyObject!
    var lastActivity : AnyObject!
    var lastLogin : AnyObject!
    var lastName : AnyObject!
    var lockoutAttempts : AnyObject!
    var lockoutDate : AnyObject!
    var mobileNumber : AnyObject!
    var oldId : AnyObject!
    var password : String!
    var postalCode : AnyObject!
    var state : AnyObject!
    var status : String!
    var timezoneId : AnyObject!
    var token : AnyObject!
    var username : String!
    
    public func getAddress ()->AnyObject{return address}
    public func getAddress2 ()->AnyObject{return address2}
    public func getAffiliateId ()->AnyObject{return affiliateId}
    public func getAvatarUrl ()->AnyObject{return avatarUrl}
    public func getCity ()->AnyObject{return city}
    public func getCountryId ()->Int{return countryId}
    public func getCurrency ()->Int{return currency}
    public func getDateOfBirth ()->AnyObject{return dateOfBirth}
    public func getDescription ()->AnyObject{return description}
    public func getDisplayName ()->AnyObject{return displayName}
    public func getEmail ()->String{return email}
    public func getFirstName ()->AnyObject{return firstName}
    public func getFullname ()->String{return fullname}
    public func getGender ()->String{return gender}
    public func getId ()->Int{return id}
    public func getLang ()->AnyObject{return lang}
    public func getLastActivity ()->AnyObject{return lastActivity}
    public func getLastLogin ()->AnyObject{return lastLogin}
    public func getLastName ()->AnyObject{return lastName}
    public func getLockoutAttempts ()->AnyObject{return lockoutAttempts}
    public func getLockoutDate ()->AnyObject{return lockoutDate}
    public func getMobileNumber ()->AnyObject{return mobileNumber}
    public func getOldId ()->AnyObject{return oldId}
    public func getPassword ()->String{return password}
    public func getPostalCode ()->AnyObject{return postalCode}
    public func getState ()->AnyObject{return state}
    public func getStatus ()->String{return status}
    public func getTimezoneId ()->AnyObject{return timezoneId}
    public func getToken ()->AnyObject{return token}
    public func getUsername ()->String{return username}

    override public init(){super.init()}
    /**
    * Instantiate the instance using the passed dictionary values to set the properties values
    */
    init(fromDictionary dictionary: NSDictionary){
        address = dictionary["address"] as AnyObject!
        address2 = dictionary["address2"] as AnyObject!
        affiliateId = dictionary["affiliate_id"] as AnyObject!
        avatarUrl = dictionary["avatar_url"] as AnyObject!
        city = dictionary["city"] as AnyObject!
        countryId = dictionary["country_id"] as? Int
        currency = dictionary["currency"] as? Int
        dateOfBirth = dictionary["date_of_birth"] as AnyObject!
        userDescription = dictionary["description"] as AnyObject!
        displayName = dictionary["display_name"] as AnyObject!
        email = dictionary["email"] as? String
        firstName = dictionary["first_name"] as AnyObject!
        fullname = dictionary["fullname"] as? String
        gender = dictionary["gender"] as? String
        id = dictionary["id"] as? Int
        lang = dictionary["lang"] as AnyObject!
        lastActivity = dictionary["last_activity"] as AnyObject!
        lastLogin = dictionary["last_login"] as AnyObject!
        lastName = dictionary["last_name"] as AnyObject!
        lockoutAttempts = dictionary["lockout_attempts"] as AnyObject!
        lockoutDate = dictionary["lockout_date"] as AnyObject!
        mobileNumber = dictionary["mobile_number"] as AnyObject!
        oldId = dictionary["old_id"] as AnyObject!
        password = dictionary["password"] as? String
        postalCode = dictionary["postal_code"] as AnyObject!
        state = dictionary["state"] as AnyObject!
        status = dictionary["status"] as? String
        timezoneId = dictionary["timezone_id"] as AnyObject!
        token = dictionary["token"] as AnyObject!
        username = dictionary["username"] as? String
    }
    
}