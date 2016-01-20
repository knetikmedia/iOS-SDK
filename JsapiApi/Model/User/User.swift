//
//	User.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class User:NSObject{
    
 
    public var age : NSNumber!
    public var avatarUrl : String!
    public var displayname : String!
    public var country : String!
    public var dateOfBirth : AnyObject!
    public var email : String!
    public var firstName : String!
    public var fullname : String!
    public var gender : String!
    public var userId : NSNumber!
    public var inventory : AnyObject!
    public var lang : AnyObject!
    public var lastName : String!
    public var mobileNumber : AnyObject!
    public var productItem : AnyObject!
    public var token : AnyObject!
    public var username : String!
    public var wallet : [Wallet]!
    public var address : String!
    public var address2 : String!
    public var city : String!
    public var countryCode : String!
    public var currencyCode : String!
    public var languageCode : String!
    public var postalCode : String!
    public var state : String!
    public var timezoneCode : String!
    public func getAge()->NSNumber{return age;}
    public func getCountry()->String{return country;}
    public func getDateOfBirth()->AnyObject{return dateOfBirth;}
    public func getEmail()->String{return email}
    public func getFirstName()->String{
        if((firstName) != nil)
        {
            return firstName
        
        }
        else {
            return ""
        }
    
    }
    public func getFullname()->String{
        if((fullname) != nil)
        {
            return fullname
            
        }
        else {
            return ""
        }
    }
    public func getGender()->String{return gender}
    public func getId()->NSNumber{return userId}
    public func getInventory()->AnyObject{return inventory}
    public func getLang()->AnyObject{return lang}
    public func getLastName()->String{
        if((lastName) != nil)
        {
            return lastName
            
        }
        else {
            return ""
        }
}
    public func getMobileNumber()->AnyObject{return mobileNumber}
    public func getProductItem()->AnyObject{return productItem}
    public func getToken()->AnyObject{return token}
    public func getUsername()->String{return username}
    public func getWallet()->Array<Wallet>{return wallet}
    public func getDisplayName()->String{
        if((displayname) != nil)
        {
            return displayname
            
        }
        else {
            return ""
        }

    }


    
    override public init(){super.init()}
    
    /**
    * Instantiate the instance using the passed dictionary values to set the properties values
    */
    init(fromDictionary dictionary: NSDictionary){
        age = dictionary["age"] as? NSNumber
        displayname = dictionary["displayname"] as? String
        avatarUrl = dictionary["avatarUrl"] as? String
        country = dictionary["country"] as? String
        dateOfBirth = dictionary["date_of_birth"] as AnyObject!
        email = dictionary["email"] as? String
        firstName = dictionary["firstName"] as? String
        fullname = dictionary["fullname"] as? String
        gender = dictionary["gender"] as? String
        userId = dictionary["id"] as? NSNumber
        inventory = dictionary["inventory"] as AnyObject!
        lang = dictionary["lang"] as AnyObject!
        lastName = dictionary["lastName"] as? String
        mobileNumber = dictionary["mobile_number"] as AnyObject!
        productItem = dictionary["product_item"] as AnyObject!
        token = dictionary["token"] as AnyObject!
        username = dictionary["username"] as? String
        wallet = [Wallet]()
        if let walletArray = dictionary["wallet"] as? [NSDictionary]{
            for dic in walletArray{
                let value = Wallet(fromDictionary: dic)
                wallet.append(value)
            }
        }
    }
    
    public func toDictionary() -> NSDictionary
    {
        var dictionary = NSMutableDictionary()
        if address != nil{
            dictionary["address"] = address
        }
        if address2 != nil{
            dictionary["address2"] = address2
        }
        if avatarUrl != nil{
            dictionary["avatarUrl"] = avatarUrl
        }
        if city != nil{
            dictionary["city"] = city
        }
        if countryCode != nil{
            dictionary["countryCode"] = countryCode
        }
        if currencyCode != nil{
            dictionary["currencyCode"] = currencyCode
        }
        if dateOfBirth != nil{
            dictionary["dateOfBirth"] = dateOfBirth
        }
        if displayname != nil{
            dictionary["displayname"] = displayname
        }
        if email != nil{
            dictionary["email"] = email
        }
        if firstName != nil{
            dictionary["firstName"] = firstName
        }
        if fullname != nil{
            dictionary["fullname"] = fullname
        }
        if gender != nil{
            dictionary["gender"] = gender
        }
        if languageCode != nil{
            dictionary["languageCode"] = languageCode
        }
        if lastName != nil{
            dictionary["lastName"] = lastName
        }
        if mobileNumber != nil{
            dictionary["mobileNumber"] = mobileNumber
        }
        if postalCode != nil{
            dictionary["postalCode"] = postalCode
        }
        if state != nil{
            dictionary["state"] = state
        }
        if timezoneCode != nil{
            dictionary["timezoneCode"] = timezoneCode
        }
        if username != nil{
            dictionary["username"] = username
        }
        return dictionary
    }

}