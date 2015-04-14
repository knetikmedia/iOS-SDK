//
//	User.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class User{

	var age : Int!
	var avatarUrl : String!
	var country : String!
	var dateOfBirth : AnyObject!
	var email : String!
	var firstName : AnyObject!
	var fullname : String!
	var gender : String!
	var id : Int!
	var inventory : AnyObject!
	var lang : AnyObject!
	var lastName : AnyObject!
	var mobileNumber : AnyObject!
	var productItem : AnyObject!
	var token : AnyObject!
	var username : String!
	var wallet : [Wallet]!
    
    public func getAge()->Int{return age;}
    public func getAvatarUrl()->String{return avatarUrl;}
    public func getCountry()->String{return country;}
    public func getDateOfBirth()->AnyObject{return dateOfBirth;}
    public func getEmail()->String{return email}
    public func getFirstName()->AnyObject{return firstName}
    public func getFullname()->String{return fullname}
    public func getGender()->String{return gender}
    public func getId()->Int{return id}
    public func getInventory()->AnyObject{return inventory}
    public func getLang()->AnyObject{return lang}
    public func getLastName()->AnyObject{return lastName}
    public func getMobileNumber()->AnyObject{return mobileNumber}
    public func getProductItem()->AnyObject{return productItem}
    public func getToken()->AnyObject{return token}
    public func getUsername()->String{return username}
    public func getWallet()->Array<Wallet>{return wallet}

        
    init(){}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		age = dictionary["age"] as? Int
		avatarUrl = dictionary["avatar_url"] as? String
		country = dictionary["country"] as? String
		dateOfBirth = dictionary["date_of_birth"] as AnyObject!
		email = dictionary["email"] as? String
		firstName = dictionary["first_name"] as AnyObject!
		fullname = dictionary["fullname"] as? String
		gender = dictionary["gender"] as? String
		id = dictionary["id"] as? Int
		inventory = dictionary["inventory"] as AnyObject!
		lang = dictionary["lang"] as AnyObject!
		lastName = dictionary["last_name"] as AnyObject!
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

    
}