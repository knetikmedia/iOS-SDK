//
//	Order.swift
//
//	Create by Youssef on 20/6/2017
//	Copyright © 2017. All rights reserved.
import Foundation

open class GeneralNumber : NSObject{
    
    open var type : String!
    open var  value : NSNumber!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        type = dictionary["type"] as? String
        value = dictionary["value"] as? NSNumber
    }
    
   
    
}
