//
//	Batch.swift
//
//	Create by Youssef on 23/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class Batch : NSObject{

	open var body : String!
	open var method : String!
	open var uri : String!


    
    public override init(){
    
    }
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
        
		body = dictionary["body"] as? String
        
		method = dictionary["method"] as? String
        
		uri = dictionary["uri"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
        
		if body != nil{
			dictionary["body"] = body
		}
		if method != nil{
			dictionary["method"] = method
		}
		if uri != nil{
			dictionary["uri"] = uri
		}
		return dictionary
	}

}
