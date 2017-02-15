//
//	User.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class User:NSObject{
    
 
    open var age : NSNumber!
    open var avatarUrl : String!
    open var displayname : String!
    open var country : String!
    open var dateOfBirth : AnyObject!
    open var email : String!
    open var firstName : String!
    open var fullname : String!
    open var gender : String!
    open var userId : NSNumber!
    open var inventory : AnyObject!
    open var lang : AnyObject!
    open var lastName : String!
    open var mobileNumber : AnyObject!
    open var productItem : AnyObject!
    open var token : AnyObject!
    open var username : String!
    open var wallet : [Wallet]!
    open var address : String!
    open var address2 : String!
    open var city : String!
    open var countryCode : String!
    open var currencyCode : String!
    open var languageCode : String!
    open var postalCode : String!
    open var state : String!
    open var timezoneCode : String!
    open var properties : Propertie!
    open var password : String!
    open func getAge()->NSNumber{return age;}
    open func getCountry()->String{return country;}
    open func getDateOfBirth()->AnyObject{return dateOfBirth;}
    open func getEmail()->String{return email}
    open func getFirstName()->String{
        if((firstName) != nil)
        {
            return firstName
        
        }
        else {
            return ""
        }
    
    }
    open func getFullname()->String{
        if((fullname) != nil)
        {
            return fullname
            
        }
        else {
            return ""
        }
    }
    open func getGender()->String{return gender}
    open func getId()->NSNumber{return userId}
    open func getInventory()->AnyObject{return inventory}
    open func getLang()->AnyObject{return lang}
    open func getLastName()->String{
        if((lastName) != nil)
        {
            return lastName
            
        }
        else {
            return ""
        }
}
    open func getMobileNumber()->AnyObject{return mobileNumber}
    open func getProductItem()->AnyObject{return productItem}
    open func getToken()->AnyObject{return token}
    open func getUsername()->String{return username}
    open func getWallet()->Array<Wallet>{return wallet}
    open func getDisplayName()->String{
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
        password = dictionary["password"] as? String

        wallet = [Wallet]()
        if let walletArray = dictionary["wallet"] as? [NSDictionary]{
            for dic in walletArray{
                let value = Wallet(fromDictionary: dic)
                wallet.append(value)
            }
        }
        
        if let propertiesData = dictionary["properties"] as? NSDictionary{
            properties = Propertie(fromDictionary: propertiesData)
        }

    }
    
    open func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
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
        if password != nil{
            dictionary["password"] = password
        }
        if properties != nil{
            dictionary["properties"] = properties.toDictionary()
        }
        return dictionary
    }

}
