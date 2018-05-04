//
//	Order.swift
//
//	Create by Youssef on 20/6/2017
//	Copyright © 2017. All rights reserved.
import Foundation

open class GeneralNumber : NSObject{
    
    open var type : String!
    open var  value : NSNumber!
    
    public override init() {
        
    }
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        type = dictionary["type"] as? String
        value = dictionary["value"] as? NSNumber
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if type != nil{
            dictionary["type"] = type
        }
        if value != nil{
            dictionary["value"] = value
        }
        return dictionary
    }
    
}

open class GeneralMessage : NSObject{

    open var type : String!
    open var  value : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        type = dictionary["type"] as? String
        value = dictionary["value"] as? String
    }



}
